package com.project.common.utils;

import java.io.File;


public class RemoveFile {
    /**
    *@Description:删除单个文件
    */

    public static boolean deleteFile(String fileName){
        File file = new File(fileName);
        if(file.isFile() && file.exists()){
            file.delete();
            System.out.println("删除单个文件"+fileName+"成功！");
            return true;
        }else{
            System.out.println("删除单个文件"+fileName+"失败！");
            return false;
        }
    }
}
