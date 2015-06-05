package com.lj.mst.service

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsHttpSession
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsWebRequest
import org.codehaus.groovy.grails.web.util.WebUtils
import org.springframework.web.context.request.RequestContextHolder

import javax.servlet.http.Cookie

//web工具�?务
class WebUtilService {

    static transactional = false
    static scope = "singleton"

    //在�?务中使用session
    void withSession(Closure closure) {
        try {
            closure.call(session)
        }catch(IllegalStateException ise){
            log.warn("No WebRequest available")
        }
    }

    void clearSession()
    {
        session.invalidate();
    }

    //获�?�session
    public GrailsHttpSession getSession(){
		println("get Session");
        GrailsWebRequest request=RequestContextHolder.currentRequestAttributes()
        return request.session
    }

//    //获�?�request
//    public GrailsWebRequest getRequest(){
//        return RequestContextHolder.currentRequestAttributes()
//    }
    //获�?�Request object
    def getRequest(){
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        webUtils.getCurrentRequest()
    }

//获�?� the Response object
    def getResponse(){
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        webUtils.getCurrentResponse()
    }

//Getting the ServletContext object
    def getServletContext(){
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        webUtils.getServletContext()
    }

    /**
     * 获�?�客户端ip
     * <p>获�?�客户端ip</p>
     * @author 刘兆国
     * @param
     * @return
     * @Date: 2013-11-28
     * @Time: 上�?�11: 43
     */
    public String getClientIp(){
        def request = getRequest();
        def clientIp=""
        /*****获�?�外网ip********/
        if (request.getHeader("X-Forwarded-For"))
            clientIp = request.getHeader("X-Forwarded-For")
        else if(request.getHeader("X-Real-IP"))
            clientIp = request.getHeader("X-Real-IP")
        else
            clientIp = "0.0.0.0"

        /********获�?�内网ip**********/
        def vcip= request.getRemoteAddr()
        if(vcip==null||vcip==""){
            clientIp=clientIp+"."+"0.0.0.0"
        }else{
            clientIp=clientIp+"."+vcip
        }
        //println "clientIp: "+clientIp
        return clientIp;
    }

    //写入cookie
    def writeCookie(String name,String value,int day){
        Cookie cookie=new Cookie(name,value.encodeAsURL());
        cookie.setMaxAge(3600*24*day);
        cookie.setPath("/");
        //cookie.setDomain("");
        def response=getResponse();
        response.addCookie(cookie);
    }
    //读�?�cookie
    def readCookie(String name){
        String value=null;
        def request=getRequest();
        Cookie[] cookies=request.getCookies();
        for (Cookie cookie:cookies){
            if(cookie.name==name){
                value=URLDecoder.decode(cookie.value,"UTF-8")
                break;
            }
        }
        return value;
    }
    //获�?�sessionID
    def getSessionId(){
        return session.id;
    }



}
