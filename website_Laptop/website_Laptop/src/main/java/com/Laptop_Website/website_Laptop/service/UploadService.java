package com.Laptop_Website.website_Laptop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;





    public UploadService( ServletContext servletContext) {
   
    this.servletContext=servletContext;
}
// targetFolder có thể là product hoặc là avatar
    public String handleSaveFile(@RequestParam("file") MultipartFile file,String targetFolder)
    {

        try {
            if(file.isEmpty())
            {
                return "";

            }

        // Lấy dữ liệu file dưới dạng byte array
        byte[] bytes = file.getBytes();

        // Lấy đường dẫn thực tế của thư mục lưu ảnh
        String rootPath = this.servletContext.getRealPath("/resources/images");

        // Tạo thư mục "avatar" nếu chưa tồn tại
        File dir = new File(rootPath + File.separator + targetFolder);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        // Đường dẫn đầy đủ tới file sẽ lưu
        String fileName = file.getOriginalFilename(); // Lấy tên file gốc
        String finalName=System.currentTimeMillis()+"-"+ fileName;
        File serverFile = new File(dir.getAbsolutePath() + File.separator +finalName);

        // Ghi dữ liệu vào file sử dụng BufferedOutputStream
        try (FileOutputStream fos = new FileOutputStream(serverFile);
             BufferedOutputStream bos = new BufferedOutputStream(fos)) {
            bos.write(bytes);
            bos.close();
            return finalName;
        }

     

    } catch (IOException e) {
        e.printStackTrace();
     return "Có lỗi xảy ra khi upload avatar!";
    }
    }
}
