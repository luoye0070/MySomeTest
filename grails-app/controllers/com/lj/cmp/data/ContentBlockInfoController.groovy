package com.lj.cmp.data

import org.springframework.dao.DataIntegrityViolationException

class ContentBlockInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contentBlockInfoInstanceList: ContentBlockInfo.list(params), contentBlockInfoInstanceTotal: ContentBlockInfo.count()]
    }

    def create() {
        [contentBlockInfoInstance: new ContentBlockInfo(params)]
    }

    def save() {
        def contentBlockInfoInstance = new ContentBlockInfo(params)
        if (!contentBlockInfoInstance.save(flush: true)) {
            render(view: "create", model: [contentBlockInfoInstance: contentBlockInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo'), contentBlockInfoInstance.id])
        redirect(action: "show", id: contentBlockInfoInstance.id)
    }

    def show(Long id) {
        def contentBlockInfoInstance = ContentBlockInfo.get(id)
        if (!contentBlockInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo'), id])
            redirect(action: "list")
            return
        }

        [contentBlockInfoInstance: contentBlockInfoInstance]
    }

    def edit(Long id) {
        def contentBlockInfoInstance = ContentBlockInfo.get(id)
        if (!contentBlockInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo'), id])
            redirect(action: "list")
            return
        }

        [contentBlockInfoInstance: contentBlockInfoInstance]
    }

    def update(Long id, Long version) {
        def contentBlockInfoInstance = ContentBlockInfo.get(id)
        if (!contentBlockInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contentBlockInfoInstance.version > version) {
                contentBlockInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo')] as Object[],
                          "Another user has updated this ContentBlockInfo while you were editing")
                render(view: "edit", model: [contentBlockInfoInstance: contentBlockInfoInstance])
                return
            }
        }

        contentBlockInfoInstance.properties = params

        if (!contentBlockInfoInstance.save(flush: true)) {
            render(view: "edit", model: [contentBlockInfoInstance: contentBlockInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo'), contentBlockInfoInstance.id])
        redirect(action: "show", id: contentBlockInfoInstance.id)
    }

    def delete(Long id) {
        def contentBlockInfoInstance = ContentBlockInfo.get(id)
        if (!contentBlockInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            contentBlockInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}
