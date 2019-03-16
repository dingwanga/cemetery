package cn.tiantong.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.InscriptionEditorDao;
import cn.tiantong.entity.InscriptionEditor;
@Service("inscriptionEditorService")
public class InscriptionEditorServiceImpl implements InscriptionEditorService {
	@Resource(name="inscriptionEditorDao")
    private InscriptionEditorDao inscriptionEditorDao;
	public int addInscriptEditor(InscriptionEditor inscriptionEditor) {
		return inscriptionEditorDao.addInscriptEditor(inscriptionEditor);
	}

	public InscriptionEditor getWordsNumber() {
		InscriptionEditor inscriptionEditor = inscriptionEditorDao.getWordsNumber();
		return inscriptionEditor;
	}

	public InscriptionEditor getEditorText(String sgdbh,Integer wordsNumber) {
		InscriptionEditor inscriptionEditor = inscriptionEditorDao.getEditorText(sgdbh,wordsNumber);
		return inscriptionEditor;
	}

}
