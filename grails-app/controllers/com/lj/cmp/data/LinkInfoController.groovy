package com.lj.cmp.data

import org.springframework.dao.DataIntegrityViolationException

class LinkInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [linkInfoInstanceList: LinkInfo.list(params), linkInfoInstanceTotal: LinkInfo.count()]
    }

    def create() {
        [linkInfoInstance: new LinkInfo(params)]
    }

    def save() {
        def linkInfoInstance = new LinkInfo(params)
        if (!linkInfoInstance.save(flush: true)) {
            render(view: "create", model: [linkInfoInstance: linkInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'linkInfo.label', default: 'LinkInfo'), linkInfoInstance.id])
        redirect(action: "show", id: linkInfoInstance.id)
    }

    def show(Long id) {
        def linkInfoInstance = LinkInfo.get(id)
        if (!linkInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'linkInfo.label', default: 'LinkInfo'), id])
            redirect(action: "list")
            return
        }

        [linkInfoInstance: linkInfoInstance]
    }

    def edit(Long id) {
        def linkInfoInstance = LinkInfo.get(id)
        if (!linkInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'linkInfo.label', default: 'LinkInfo'), id])
            redirect(action: "list")
            return
        }

        [linkInfoInstance: linkInfoInstance]
    }

    def update(Long id, Long version) {
        def linkInfoInstance = LinkInfo.get(id)
        if (!linkInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'linkInfo.label', default: 'LinkInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (linkInfoInstance.version > version) {
                linkInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'linkInfo.label', default: 'LinkInfo')] as Object[],
                          "Another user has updated this LinkInfo while you were editing")
                render(view: "edit", model: [linkInfoInstance: linkInfoInstance])
                return
            }
        }

        linkInfoInstance.properties = params

        if (!linkInfoInstance.save(flush: true)) {
            render(view: "edit", model: [linkInfoInstance: linkInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'linkInfo.label', default: 'LinkInfo'), linkInfoInstance.id])
        redirect(action: "show", id: linkInfoInstance.id)
    }

    def delete(Long id) {
        def linkInfoInstance = LinkInfo.get(id)
        if (!linkInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'linkInfo.label', default: 'LinkInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            linkInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'linkInfo.label', default: 'LinkInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'linkInfo.label', default: 'LinkInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}
