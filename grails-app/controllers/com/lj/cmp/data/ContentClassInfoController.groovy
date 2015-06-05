package com.lj.cmp.data

import org.springframework.dao.DataIntegrityViolationException

class ContentClassInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contentClassInfoInstanceList: ContentClassInfo.list(params), contentClassInfoInstanceTotal: ContentClassInfo.count()]
    }

    def create() {
        [contentClassInfoInstance: new ContentClassInfo(params)]
    }

    def save() {
        def contentClassInfoInstance = new ContentClassInfo(params)
        if (!contentClassInfoInstance.save(flush: true)) {
            render(view: "create", model: [contentClassInfoInstance: contentClassInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contentClassInfo.label', default: 'ContentClassInfo'), contentClassInfoInstance.id])
        redirect(action: "show", id: contentClassInfoInstance.id)
    }

    def show(Long id) {
        def contentClassInfoInstance = ContentClassInfo.get(id)
        if (!contentClassInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentClassInfo.label', default: 'ContentClassInfo'), id])
            redirect(action: "list")
            return
        }

        [contentClassInfoInstance: contentClassInfoInstance]
    }

    def edit(Long id) {
        def contentClassInfoInstance = ContentClassInfo.get(id)
        if (!contentClassInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentClassInfo.label', default: 'ContentClassInfo'), id])
            redirect(action: "list")
            return
        }

        [contentClassInfoInstance: contentClassInfoInstance]
    }

    def update(Long id, Long version) {
        def contentClassInfoInstance = ContentClassInfo.get(id)
        if (!contentClassInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentClassInfo.label', default: 'ContentClassInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contentClassInfoInstance.version > version) {
                contentClassInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contentClassInfo.label', default: 'ContentClassInfo')] as Object[],
                          "Another user has updated this ContentClassInfo while you were editing")
                render(view: "edit", model: [contentClassInfoInstance: contentClassInfoInstance])
                return
            }
        }

        contentClassInfoInstance.properties = params

        if (!contentClassInfoInstance.save(flush: true)) {
            render(view: "edit", model: [contentClassInfoInstance: contentClassInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contentClassInfo.label', default: 'ContentClassInfo'), contentClassInfoInstance.id])
        redirect(action: "show", id: contentClassInfoInstance.id)
    }

    def delete(Long id) {
        def contentClassInfoInstance = ContentClassInfo.get(id)
        if (!contentClassInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentClassInfo.label', default: 'ContentClassInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            contentClassInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contentClassInfo.label', default: 'ContentClassInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contentClassInfo.label', default: 'ContentClassInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}
