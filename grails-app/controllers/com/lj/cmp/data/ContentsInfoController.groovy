package com.lj.cmp.data

import org.springframework.dao.DataIntegrityViolationException

class ContentsInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contentsInfoInstanceList: ContentsInfo.list(params), contentsInfoInstanceTotal: ContentsInfo.count()]
    }

    def create() {
        [contentsInfoInstance: new ContentsInfo(params)]
    }

    def save() {
        def contentsInfoInstance = new ContentsInfo(params)
        if (!contentsInfoInstance.save(flush: true)) {
            render(view: "create", model: [contentsInfoInstance: contentsInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contentsInfo.label', default: 'ContentsInfo'), contentsInfoInstance.id])
        redirect(action: "show", id: contentsInfoInstance.id)
    }

    def show(Long id) {
        def contentsInfoInstance = ContentsInfo.get(id)
        if (!contentsInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentsInfo.label', default: 'ContentsInfo'), id])
            redirect(action: "list")
            return
        }

        [contentsInfoInstance: contentsInfoInstance]
    }

    def edit(Long id) {
        def contentsInfoInstance = ContentsInfo.get(id)
        if (!contentsInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentsInfo.label', default: 'ContentsInfo'), id])
            redirect(action: "list")
            return
        }

        [contentsInfoInstance: contentsInfoInstance]
    }

    def update(Long id, Long version) {
        def contentsInfoInstance = ContentsInfo.get(id)
        if (!contentsInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentsInfo.label', default: 'ContentsInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contentsInfoInstance.version > version) {
                contentsInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contentsInfo.label', default: 'ContentsInfo')] as Object[],
                          "Another user has updated this ContentsInfo while you were editing")
                render(view: "edit", model: [contentsInfoInstance: contentsInfoInstance])
                return
            }
        }

        contentsInfoInstance.properties = params

        if (!contentsInfoInstance.save(flush: true)) {
            render(view: "edit", model: [contentsInfoInstance: contentsInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contentsInfo.label', default: 'ContentsInfo'), contentsInfoInstance.id])
        redirect(action: "show", id: contentsInfoInstance.id)
    }

    def delete(Long id) {
        def contentsInfoInstance = ContentsInfo.get(id)
        if (!contentsInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentsInfo.label', default: 'ContentsInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            contentsInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contentsInfo.label', default: 'ContentsInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contentsInfo.label', default: 'ContentsInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}
