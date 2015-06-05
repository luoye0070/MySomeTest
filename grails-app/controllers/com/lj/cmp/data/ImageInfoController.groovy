package com.lj.cmp.data

import org.springframework.dao.DataIntegrityViolationException

class ImageInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [imageInfoInstanceList: ImageInfo.list(params), imageInfoInstanceTotal: ImageInfo.count()]
    }

    def create() {
        [imageInfoInstance: new ImageInfo(params)]
    }

    def save() {
        def imageInfoInstance = new ImageInfo(params)
        if (!imageInfoInstance.save(flush: true)) {
            render(view: "create", model: [imageInfoInstance: imageInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'imageInfo.label', default: 'ImageInfo'), imageInfoInstance.id])
        redirect(action: "show", id: imageInfoInstance.id)
    }

    def show(Long id) {
        def imageInfoInstance = ImageInfo.get(id)
        if (!imageInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imageInfo.label', default: 'ImageInfo'), id])
            redirect(action: "list")
            return
        }

        [imageInfoInstance: imageInfoInstance]
    }

    def edit(Long id) {
        def imageInfoInstance = ImageInfo.get(id)
        if (!imageInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imageInfo.label', default: 'ImageInfo'), id])
            redirect(action: "list")
            return
        }

        [imageInfoInstance: imageInfoInstance]
    }

    def update(Long id, Long version) {
        def imageInfoInstance = ImageInfo.get(id)
        if (!imageInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imageInfo.label', default: 'ImageInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (imageInfoInstance.version > version) {
                imageInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'imageInfo.label', default: 'ImageInfo')] as Object[],
                          "Another user has updated this ImageInfo while you were editing")
                render(view: "edit", model: [imageInfoInstance: imageInfoInstance])
                return
            }
        }

        imageInfoInstance.properties = params

        if (!imageInfoInstance.save(flush: true)) {
            render(view: "edit", model: [imageInfoInstance: imageInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'imageInfo.label', default: 'ImageInfo'), imageInfoInstance.id])
        redirect(action: "show", id: imageInfoInstance.id)
    }

    def delete(Long id) {
        def imageInfoInstance = ImageInfo.get(id)
        if (!imageInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imageInfo.label', default: 'ImageInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            imageInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'imageInfo.label', default: 'ImageInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'imageInfo.label', default: 'ImageInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}
