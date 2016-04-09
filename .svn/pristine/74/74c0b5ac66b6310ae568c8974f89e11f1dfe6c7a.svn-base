package com.guanglumedia.util;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.guanglumedia.cms.analysis.entity.AccessCategory;

public class ExportExcelUtils {
    /**
     * POI : 导出数据，存放于Excel中
     * 
     * @param os
     *            输出流 (action: OutputStream os = response.getOutputStream();)
     * @param employeeInfos
     *            要导出的数据集合
     */

    public static void exportOrderList(OutputStream os, List<Map<String, Object>> orders) {

        try {
            // 创建Excel工作薄
            HSSFWorkbook book = new HSSFWorkbook();
            // 在Excel工作薄中建一张工作表
            HSSFSheet sheet = book.createSheet("订购列表");
            // 设置单元格格式(文本)
            // HSSFCellStyle cellStyle = book.createCellStyle();
            // 第一行为标题行
            HSSFRow row = sheet.createRow(0);// 创建第一行
            HSSFCell cell0 = row.createCell(0);
            HSSFCell cell1 = row.createCell(1);
            HSSFCell cell2 = row.createCell(2);
            HSSFCell cell3 = row.createCell(3);
            HSSFCell cell4 = row.createCell(4);
            HSSFCell cell5 = row.createCell(5);
            // 定义单元格为字符串类型
            cell0.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell4.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell5.setCellType(HSSFCell.CELL_TYPE_STRING);
            // 在单元格中输入数据
            cell0.setCellValue("订单编号");
            cell1.setCellValue("用户id");
            cell2.setCellValue("订购影片");
            cell3.setCellValue("产品名称");
            cell4.setCellValue("订单价格");
            cell5.setCellValue("订单时间");
            // 循环导出数据到excel中
            for (int i = 0; i < orders.size(); i++) {
                Map<String, Object> order = orders.get(i);
                // 创建第i行
                HSSFRow rowi = sheet.createRow(i + 1);
                // 在第i行的相应列中加入相应的数据
                rowi.createCell(0).setCellValue(order.get("id").toString());
                rowi.createCell(1).setCellValue(order.get("userId").toString());
                if (order.get("filmName") != null) {
                    rowi.createCell(2).setCellValue(order.get("filmName").toString());
                } else {
                    rowi.createCell(2).setCellValue("");
                }
                if (order.get("productname") != null) {
                    rowi.createCell(3).setCellValue(order.get("productname").toString());
                } else {
                    rowi.createCell(3).setCellValue("");
                }
                if (order.get("price") != null) {
                    rowi.createCell(4).setCellValue(order.get("price").toString());
                } else {
                    rowi.createCell(4).setCellValue("");
                }
                rowi.createCell(5).setCellValue(order.get("recordtime").toString());

            }
            // 写入数据 把相应的Excel 工作簿存盘
            book.write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void exportAccessCategoryList(OutputStream os, List<Map<String, Object>> accessCategorys,AccessCategory ac) {
        try {
            // 创建Excel工作薄
            HSSFWorkbook book = new HSSFWorkbook();
            // 在Excel工作薄中建一张工作表
            HSSFSheet sheet = book.createSheet("用户访问统计列表");
            // 设置单元格格式(文本)
            // HSSFCellStyle cellStyle = book.createCellStyle();
            // 第一行为标题行
            HSSFRow row = sheet.createRow(0);// 创建第一行
            HSSFCell cell0 = row.createCell(0);
            HSSFCell cell1 = row.createCell(1);
            HSSFCell cell2 = row.createCell(2);
            // 定义单元格为字符串类型
            cell0.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
            // 在单元格中输入数据
            cell0.setCellValue("统计点");
            cell1.setCellValue("访问量");
            cell2.setCellValue("操作时间段");
            // 循环导出数据到excel中
            for (int i = 0; i < accessCategorys.size(); i++) {
                Map<String, Object> accessCategory = accessCategorys.get(i);
                // 创建第i行
                HSSFRow rowi = sheet.createRow(i + 1);
                // 在第i行的相应列中加入相应的数据
                rowi.createCell(0).setCellValue(accessCategory.get("desc").toString());
                rowi.createCell(1).setCellValue(accessCategory.get("counter").toString());
                rowi.createCell(2).setCellValue(ac.getStarttime()+"至"+ac.getEndtime());

            }
            // 写入数据 把相应的Excel 工作簿存盘
            book.write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public static void exportcardepk(OutputStream os, List<Map<String, Object>> epks) {

        try {
            // 创建Excel工作薄
            HSSFWorkbook book = new HSSFWorkbook();
            // 在Excel工作薄中建一张工作表
            HSSFSheet sheet = book.createSheet("观影码");
            // 设置单元格格式(文本)
            // HSSFCellStyle cellStyle = book.createCellStyle();
            // 第一行为标题行
            HSSFRow row = sheet.createRow(0);// 创建第一行
            HSSFCell cell0 = row.createCell(0);
            HSSFCell cell1 = row.createCell(1);
            // 定义单元格为字符串类型
            cell0.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
            // 在单元格中输入数据
            cell0.setCellValue("批次");
            cell1.setCellValue("观影码");
            // 循环导出数据到excel中
            for (int i = 0; i < epks.size(); i++) {
                Map<String, Object> order = epks.get(i);
                // 创建第i行
                HSSFRow rowi = sheet.createRow(i + 1);
                // 在第i行的相应列中加入相应的数据
                rowi.createCell(0).setCellValue(order.get("epkId").toString());
                rowi.createCell(1).setCellValue(order.get("evcnId").toString());
            }
            // 写入数据 把相应的Excel 工作簿存盘
            book.write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
   
}
