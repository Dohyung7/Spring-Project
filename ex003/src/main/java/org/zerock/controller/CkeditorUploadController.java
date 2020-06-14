package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.spi.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CkeditorUploadController {
	// ��Ʈ�ѷ�Ŭ������ �α׸� ���
   
 
    // �̹��� ���ε�
    // product_edit���������� ���εǴ� �޼ҵ�
    @RequestMapping("imageUpload.do")
 
    // �̹����� �����ϰ�, �ҷ�����, ���ε��ϱ����� �Ű������� ����
    public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
    //MultipartFile Ÿ���� ckedit���� upload�� �̸����� �����ϰ� �ȴ�
            throws Exception {
 
        // �ѱ۱����� �����ϱ����� ���ڼ� ����
        response.setCharacterEncoding("utf-8");
 
        // ���������� �Ķ���ͷ� ���޵Ǵ� response ��ü�� �ѱ� ����
        response.setContentType("text/html; charset=utf-8");
 
        // ���ε��� ���� �̸�
        String fileName = upload.getOriginalFilename();
 
        // ������ ����Ʈ �迭�� ��ȯ
        byte[] bytes = upload.getBytes();
 
        // �̹����� ���ε��� ���丮(���� ���丮�� ����)
        String uploadPath = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\spring02\\WEB-INF\\views\\images\\";

  
        
        OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
 
        // ������ ���ε�
        // write�޼ҵ��� �Ű������� ������ �� ����Ʈ�� �Ű������� �ش�.
        // ������ ����Ʈ�� ��� ��Ʈ���� ���� (����ϱ� ���ؼ�)
        out.write(bytes);
 
        // Ŭ���̾�Ʈ�� ��� ǥ��
        String callback = request.getParameter("CKEditorFuncNum");
 
        // ����=>Ŭ���̾�Ʈ�� �ؽ�Ʈ ����(�ڹٽ�ũ��Ʈ ����)
        PrintWriter printWriter = response.getWriter();
        String fileUrl = request.getContextPath() + "/images/" + fileName;
        printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
                + "','�̹����� ���ε�Ǿ����ϴ�.')" + "</script>");
        printWriter.flush();
    }
}

