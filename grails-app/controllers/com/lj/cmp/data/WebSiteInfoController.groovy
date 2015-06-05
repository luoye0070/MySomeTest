package com.lj.cmp.data

import org.springframework.dao.DataIntegrityViolationException

class WebSiteInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [webSiteInfoInstanceList: WebSiteInfo.list(params), webSiteInfoInstanceTotal: WebSiteInfo.count()]
    }

    def create() {
        [webSiteInfoInstance: new WebSiteInfo(params)]
    }

    def save() {
        def webSiteInfoInstance = new WebSiteInfo(params)
        if (!webSiteInfoInstance.save(flush: true)) {
            render(view: "create", model: [webSiteInfoInstance: webSiteInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'webSiteInfo.label', default: 'WebSiteInfo'), webSiteInfoInstance.id])
        redirect(action: "show", id: webSiteInfoInstance.id)
    }

    def show(Long id) {
        def webSiteInfoInstance = WebSiteInfo.get(id)
        if (!webSiteInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'webSiteInfo.label', default: 'WebSiteInfo'), id])
            redirect(action: "list")
            return
        }

        [webSiteInfoInstance: webSiteInfoInstance]
    }

    def edit(Long id) {
        def webSiteInfoInstance = WebSiteInfo.get(id)
        if (!webSiteInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'webSiteInfo.label', default: 'WebSiteInfo'), id])
            redirect(action: "list")
            return
        }

        [webSiteInfoInstance: webSiteInfoInstance]
    }

    def update(Long id, Long version) {
        def webSiteInfoInstance = WebSiteInfo.get(id)
        if (!webSiteInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'webSiteInfo.label', default: 'WebSiteInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (webSiteInfoInstance.version > version) {
                webSiteInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'webSiteInfo.label', default: 'WebSiteInfo')] as Object[],
                          "Another user has updated this WebSiteInfo while you were editing")
                render(view: "edit", model: [webSiteInfoInstance: webSiteInfoInstance])
                return
            }
        }

        webSiteInfoInstance.properties = params

        if (!webSiteInfoInstance.save(flush: true)) {
            render(view: "edit", model: [webSiteInfoInstance: webSiteInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'webSiteInfo.label', default: 'WebSiteInfo'), webSiteInfoInstance.id])
        redirect(action: "show", id: webSiteInfoInstance.id)
    }

    def delete(Long id) {
        def webSiteInfoInstance = WebSiteInfo.get(id)
        if (!webSiteInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'webSiteInfo.label', default: 'WebSiteInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            webSiteInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'webSiteInfo.label', default: 'WebSiteInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'webSiteInfo.label', default: 'WebSiteInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}
