package com.lj.mst.service

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsHttpSession
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsWebRequest
import org.codehaus.groovy.grails.web.util.WebUtils
import org.springframework.web.context.request.RequestContextHolder

import javax.servlet.http.Cookie

//webå·¥å…·æœ?åŠ¡
class WebUtilService {

    static transactional = false
    static scope = "singleton"

    //åœ¨æœ?åŠ¡ä¸­ä½¿ç”¨session
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

    //èŽ·å?–session
    public GrailsHttpSession getSession(){
		println("get Session");
        GrailsWebRequest request=RequestContextHolder.currentRequestAttributes()
        return request.session
    }

//    //èŽ·å?–request
//    public GrailsWebRequest getRequest(){
//        return RequestContextHolder.currentRequestAttributes()
//    }
    //èŽ·å?–Request object
    def getRequest(){
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        webUtils.getCurrentRequest()
    }

//èŽ·å?– the Response object
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
     * èŽ·å?–å®¢æˆ·ç«¯ip
     * <p>èŽ·å?–å®¢æˆ·ç«¯ip</p>
     * @author åˆ˜å…†å›½
     * @param
     * @return
     * @Date: 2013-11-28
     * @Time: ä¸Šå?ˆ11: 43
     */
    public String getClientIp(){
        def request = getRequest();
        def clientIp=""
        /*****èŽ·å?–å¤–ç½‘ip********/
        if (request.getHeader("X-Forwarded-For"))
            clientIp = request.getHeader("X-Forwarded-For")
        else if(request.getHeader("X-Real-IP"))
            clientIp = request.getHeader("X-Real-IP")
        else
            clientIp = "0.0.0.0"

        /********èŽ·å?–å†…ç½‘ip**********/
        def vcip= request.getRemoteAddr()
        if(vcip==null||vcip==""){
            clientIp=clientIp+"."+"0.0.0.0"
        }else{
            clientIp=clientIp+"."+vcip
        }
        //println "clientIp: "+clientIp
        return clientIp;
    }

    //å†™å…¥cookie
    def writeCookie(String name,String value,int day){
        Cookie cookie=new Cookie(name,value.encodeAsURL());
        cookie.setMaxAge(3600*24*day);
        cookie.setPath("/");
        //cookie.setDomain("");
        def response=getResponse();
        response.addCookie(cookie);
    }
    //è¯»å?–cookie
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
    //èŽ·å?–sessionID
    def getSessionId(){
        return session.id;
    }



}
