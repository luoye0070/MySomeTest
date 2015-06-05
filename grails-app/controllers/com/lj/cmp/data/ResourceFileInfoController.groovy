package com.lj.cmp.data

import org.springframework.dao.DataIntegrityViolationException

class ResourceFileInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [resourceFileInfoInstanceList: ResourceFileInfo.list(params), resourceFileInfoInstanceTotal: ResourceFileInfo.count()]
    }

    def create() {
        [resourceFileInfoInstance: new ResourceFileInfo(params)]
    }

    def save() {
        def resourceFileInfoInstance = new ResourceFileInfo(params)
        if (!resourceFileInfoInstance.save(flush: true)) {
            render(view: "create", model: [resourceFileInfoInstance: resourceFileInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo'), resourceFileInfoInstance.id])
        redirect(action: "show", id: resourceFileInfoInstance.id)
    }

    def show(Long id) {
        def resourceFileInfoInstance = ResourceFileInfo.get(id)
        if (!resourceFileInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo'), id])
            redirect(action: "list")
            return
        }

        [resourceFileInfoInstance: resourceFileInfoInstance]
    }

    def edit(Long id) {
        def resourceFileInfoInstance = ResourceFileInfo.get(id)
        if (!resourceFileInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo'), id])
            redirect(action: "list")
            return
        }

        [resourceFileInfoInstance: resourceFileInfoInstance]
    }

    def update(Long id, Long version) {
        def resourceFileInfoInstance = ResourceFileInfo.get(id)
        if (!resourceFileInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (resourceFileInfoInstance.version > version) {
                resourceFileInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo')] as Object[],
                          "Another user has updated this ResourceFileInfo while you were editing")
                render(view: "edit", model: [resourceFileInfoInstance: resourceFileInfoInstance])
                return
            }
        }

        resourceFileInfoInstance.properties = params

        if (!resourceFileInfoInstance.save(flush: true)) {
            render(view: "edit", model: [resourceFileInfoInstance: resourceFileInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo'), resourceFileInfoInstance.id])
        redirect(action: "show", id: resourceFileInfoInstance.id)
    }

    def delete(Long id) {
        def resourceFileInfoInstance = ResourceFileInfo.get(id)
        if (!resourceFileInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            resourceFileInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}
