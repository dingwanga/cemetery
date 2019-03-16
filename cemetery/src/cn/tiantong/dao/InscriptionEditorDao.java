package cn.tiantong.dao;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.InscriptionEditor;

public interface InscriptionEditorDao {
	//新增編輯數量
    int addInscriptEditor(InscriptionEditor inscriptionEditor);
    //查询編輯的文本個數
   	InscriptionEditor getWordsNumber();
   	//获得编辑文本
   	InscriptionEditor getEditorText(@Param("sgdbh")String sgdbh, @Param("wordsNumber")Integer wordsNumber);
}
