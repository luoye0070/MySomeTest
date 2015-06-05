package com.lj.mst.service

import com.lj.cmp.util.common.I18nError
import com.lj.cmp.util.customenum.ReCode
import com.lj.cmp.util.customenum.ResourceType
import com.lj.cmp.data.LinkInfo
import com.lj.cmp.data.ResourceFileInfo
import com.lj.cmp.data.WebSiteInfo

import com.lj.cmp.util.common.Number
import com.lj.cmp.util.common.TypeConversion;

class WebSiteInfoService extends com.lj.cmp.service.siteconfig.WebSiteInfoService {
    def webUtilService;
    def g = new org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib();

    def getWebSiteInfo() {
		println("getWebSiteInfo");
        WebSiteInfo webSiteInfo = WebSiteInfo.first();
        if (webSiteInfo == null) {
            webSiteInfo = new WebSiteInfo();//没有则创建一个
            webSiteInfo.siteName = "中国人�?伊�?分公�?�幸�?�?业工作部";//网站�??称
            webSiteInfo.logoUrl = "";
            webSiteInfo.flashUrl = ""; //首页Flash地�?�
            webSiteInfo.imageUrl = ""; //首页图片地�?�
            webSiteInfo.maxSizeOfFile = 1024 * 1024 * 100;//上传资�?文件最大字节数
            if (webSiteInfo.save(flush: true)) {
                webSiteInfo.refresh();
            }
        }
        return [recode: ReCode.OK, webSiteInfo: webSiteInfo];
    }
}
