package com.lj.mst.data

import org.springframework.dao.DataIntegrityViolationException

class TestDataController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
		System.out.println(TestData.constraints.xh.widget);
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def tds=TestData.executeQuery("select s from TestData as s order by xh desc,xh1 desc");
        [testDataInstanceList: tds, testDataInstanceTotal: TestData.count()]
    }

    def create() {
        [testDataInstance: new TestData(params)]
    }

    def save() {
        def testDataInstance = new TestData(params)
        if (!testDataInstance.save(flush: true)) {
            render(view: "create", model: [testDataInstance: testDataInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'testData.label', default: 'TestData'), testDataInstance.id])
        redirect(action: "show", id: testDataInstance.id)
    }

    def show(Long id) {
        def testDataInstance = TestData.get(id)
        if (!testDataInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testData.label', default: 'TestData'), id])
            redirect(action: "list")
            return
        }

        [testDataInstance: testDataInstance]
    }

    def edit(Long id) {
        def testDataInstance = TestData.get(id)
        if (!testDataInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testData.label', default: 'TestData'), id])
            redirect(action: "list")
            return
        }

        [testDataInstance: testDataInstance]
    }

    def update(Long id, Long version) {
        def testDataInstance = TestData.get(id)
        if (!testDataInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testData.label', default: 'TestData'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (testDataInstance.version > version) {
                testDataInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'testData.label', default: 'TestData')] as Object[],
                          "Another user has updated this TestData while you were editing")
                render(view: "edit", model: [testDataInstance: testDataInstance])
                return
            }
        }

        testDataInstance.properties = params

        if (!testDataInstance.save(flush: true)) {
            render(view: "edit", model: [testDataInstance: testDataInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'testData.label', default: 'TestData'), testDataInstance.id])
        redirect(action: "show", id: testDataInstance.id)
    }

    def delete(Long id) {
        def testDataInstance = TestData.get(id)
        if (!testDataInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testData.label', default: 'TestData'), id])
            redirect(action: "list")
            return
        }

        try {
            testDataInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'testData.label', default: 'TestData'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'testData.label', default: 'TestData'), id])
            redirect(action: "show", id: id)
        }
    }
}
