package com.sqfs.utils;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;
@Slf4j
public final class PicUtil {
	
	
	/**
	 * 上传图片
	 */
	public static String getPicName(MultipartFile pic,HttpServletRequest request) {
		
		String picName="";
		String  picPath=request.getRealPath("/");
		picPath=picPath.replace(picPath, picPath+"img");
		boolean flag=pic.isEmpty();
		if (!flag) {
			picName=UuidUtil.getUuid()+pic.getOriginalFilename();
			//picPath下的一个图片picName
			File file=new File(picPath + "/" + picName);
			try {
				pic.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return picName;
	}
	
	
	/**
	 *	从项目中webapp下的img中下载图片
	 * @param
	 * @return
	 * @exception
	 */
	public static void loanPic(String picPath,HttpServletRequest request,HttpServletResponse response){
		
		String  path=request.getRealPath("/");
		path=path.replace(path, path+"img");
		File  file=new File(path+"/"+picPath);
		log.info("========"+file);
		if(file==null || !file.exists()){
			return;
		}
	

		OutputStream os=null;
		try {
			response.reset();
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader("content-Disposition","attachment;filename="+file.getName() );
			os=response.getOutputStream();
			os.write(FileUtils.readFileToByteArray(file));
			os.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
