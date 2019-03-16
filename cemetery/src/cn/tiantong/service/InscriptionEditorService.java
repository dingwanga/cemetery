package cn.tiantong.service;

import cn.tiantong.entity.InscriptionEditor;

public interface InscriptionEditorService {
	//新增編輯數量
    int addInscriptEditor(InscriptionEditor inscriptionEditor);
    //查询編輯的文本個數
	InscriptionEditor getWordsNumber();
	//获得编辑文本
   	InscriptionEditor getEditorText(String sgdbh,Integer wordsNumber);
}
