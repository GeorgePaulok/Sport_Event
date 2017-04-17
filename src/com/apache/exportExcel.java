package com.apache; /**
 * Created by 晨阳 on 2017/3/1.
 */
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.poi.hssf.usermodel.*;

public class exportExcel {
    public void Export(OutputStream outs,String team_name) throws IOException, SQLException {
        // 声明一个工作薄
        HSSFWorkbook wb = new HSSFWorkbook();
        //声明一个单子并命名
        HSSFSheet sheet = wb.createSheet("sheet1");
        //给单子名称一个长度
        sheet.setDefaultColumnWidth((short)15);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        //创建第一行（也可以称为表头）
        HSSFRow row = null;
        //样式字体居中
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //给表头第一行一次创建单元格
        ResultSet set = JDBCTools.Select("SELECT * FROM team");
        while(set.next()){
            if(team_name.equals(set.getString(1))){
                row = sheet.createRow(0);
                row.createCell(0).setCellValue("参赛队名:");
                row.createCell(1).setCellValue(set.getString(1));
                row = sheet.createRow(1);
                row.createCell(0).setCellValue("团长：");
                row.createCell(1).setCellValue(set.getString(2));
                row = sheet.createRow(2);
                row.createCell(0).setCellValue("领队：");
                row.createCell(1).setCellValue(set.getString(3));
                row = sheet.createRow(3);
                row.createCell(0).setCellValue("教练：");
                row.createCell(1).setCellValue(set.getString(4));
                row = sheet.createRow(4);
                row.createCell(0).setCellValue("工作人员：");
                row.createCell(1).setCellValue(set.getString(5));
                row = sheet.createRow(5);
                row.createCell(0).setCellValue("队医：");
                row.createCell(1).setCellValue(set.getString(6));
                row = sheet.createRow(6);
                row.createCell(0).setCellValue("联系方式：");
                row.createCell(1).setCellValue(set.getString(7));
                break;
            }
        }
        //set.close();
        row = sheet.createRow(7);
        HSSFCell cell = row.createCell((short) 0);
        cell.setCellValue("号码");
        cell.setCellStyle(style);
        cell = row.createCell( (short) 1);
        cell.setCellValue("姓名");
        cell.setCellStyle(style);
        cell = row.createCell((short) 2);
        cell.setCellValue("性别");
        cell.setCellStyle(style);
        cell = row.createCell((short) 3);
        cell.setCellValue("组别");
        cell.setCellStyle(style);
        cell = row.createCell((short) 4);
        cell.setCellValue("身高");
        cell.setCellStyle(style);
        cell = row.createCell((short) 5);
        cell.setCellValue("体重");
        cell.setCellStyle(style);
        cell = row.createCell((short) 6);
        cell.setCellValue("身份证号");
        cell.setCellStyle(style);
        cell = row.createCell((short) 7);
        cell.setCellValue("备注");
        cell.setCellStyle(style);
        cell = row.createCell((short) 8);
        cell.setCellValue("项目一");
        cell.setCellStyle(style);
        cell = row.createCell((short) 9);
        cell.setCellValue("项目二");
        cell.setCellStyle(style);
        cell = row.createCell((short) 10);
        cell.setCellValue("项目三");
        cell.setCellStyle(style);
        cell = row.createCell((short) 11);
        cell.setCellValue("项目四");
        cell.setCellStyle(style);
        cell = row.createCell((short) 12);
        cell.setCellValue("项目五");
        cell.setCellStyle(style);


        ResultSet resultSet = JDBCTools.Select("SELECT * FROM player_info");
        int i = 8;
        while(resultSet.next()){
            if(resultSet.getString(1).equals(team_name)){
                row = sheet.createRow(i + 1);
                int k =2;
                row.createCell(0).setCellValue(resultSet.getString(15));
                for(int j = 1;j < 13;j++,k++){
                    if(j==3){
                        row.createCell(j+0).setCellValue(resultSet.getString(8));
                        j++;
                    }
                    if(k==8){
                        k++;
                    }
                    row.createCell(j+0).setCellValue(resultSet.getString(k));
                }
                i++;
            }
        }
        //resultSet.close();
        File excel_file = new File("E:/picture/player.xls");
        wb.write(excel_file);

        resultSet = JDBCTools.Select("SELECT * FROM player_info");
        File zipFile = new File("E:/picture/"+team_name+".zip");
        byte[] buf = new byte[1024];
        int len;
        ZipOutputStream zout=new ZipOutputStream(new FileOutputStream(zipFile));
        while(resultSet.next()){
            if(team_name.equals(resultSet.getString(1))){
                FileInputStream in =new FileInputStream(new File(resultSet.getString("Player_Photo")));
                zout.putNextEntry(new ZipEntry(resultSet.getString("Player_Number")+".png"));
                while ((len = in.read(buf)) > 0) {
                    zout.write(buf, 0, len);
                }
                zout.closeEntry();
                in.close();
            }
        }
        FileInputStream fis = new FileInputStream(excel_file);
        zout.putNextEntry(new ZipEntry("player.xls"));
        while ((len = fis.read(buf)) > 0) {
            zout.write(buf, 0, len);
        }
        zout.closeEntry();
        fis.close();
        zout.close();
        //resultSet.close();

        //下载图片
        FileInputStream zipInput =new FileInputStream(zipFile);
        while ((len=zipInput.read(buf))!= -1){
            outs.write(buf,0,len);
        }
        zipInput.close();
        outs.flush();
        outs.close();
        //删除压缩包
        zipFile.delete();


        /*try {
            //默认导出到E盘下
            FileOutputStream out = new FileOutputStream("E://学生表.xls");
            wb.write(out);
            out.close();
            JOptionPane.showMessageDialog(null, "导出成功!");
        } catch (FileNotFoundException e) {
            JOptionPane.showMessageDialog(null, "导出失败!");
            e.printStackTrace();
        } catch (IOException e) {
            JOptionPane.showMessageDialog(null, "导出失败!");
            e.printStackTrace();
        }*/
    }
}