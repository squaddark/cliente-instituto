public without sharing class ContactTriggerHandler extends TriggerHandler{

    private ContactBO objBO = ContactBO.getInstance();

	private List<Contact> lstSObjContactNew;

	private Map<Id, Contact> mapSObjContactOld;

	/**
	 * @Author: Everymind
	 * @Date: 17/06/2021
	 * @Description: Contrutor sem parâmetros da classe
	 */	
	public ContactTriggerHandler() {
		this.lstSObjContactNew = (List<Contact>) Trigger.new;
		this.mapSObjContactOld = (Map<Id, Contact>) Trigger.oldMap;
	}

	/**
	 * @Author: Everymind
	 * @Date: 01/10/2021
	 * @Description: Método que é executado antes da atualização de um registro de Contact
	 */
	public override void afterInsert() {
		objBO.createRelation(this.lstSObjContactNew, this.mapSObjContactOld);
	}

    	/**
	 * @Author: Everymind
	 * @Date: 01/10/2021
	 * @Description: Método que é executado antes da atualização de um registro de Contact
	 */
	public override void afterUpdate() {
		objBO.createRelation(this.lstSObjContactNew, this.mapSObjContactOld);
	}
}