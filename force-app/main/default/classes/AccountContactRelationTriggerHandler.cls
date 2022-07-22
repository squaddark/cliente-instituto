public with sharing class AccountContactRelationTriggerHandler extends TriggerHandler{

    private ContactShareBO objBO = ContactShareBO.getInstance();

	private List<AccountContactRelation> lstSObjAccountContactRelationNew;

	private Map<Id, AccountContactRelation> mapSObjAccountContactRelationOld;

	/**
	 * @Author: Everymind
	 * @Date: 17/06/2021
	 * @Description: Contrutor sem parâmetros da classe
	 */	
	public AccountContactRelationTriggerHandler() {
		this.lstSObjAccountContactRelationNew = (List<AccountContactRelation>) Trigger.new;
		this.mapSObjAccountContactRelationOld = (Map<Id, AccountContactRelation>) Trigger.oldMap;
	}

	/**
	 * @Author: Everymind
	 * @Date: 01/10/2021
	 * @Description: Método que é executado antes da atualização de um registro de AccountContactRelation
	 */
	public override void afterInsert() {
		objBO.createRelation(this.lstSObjAccountContactRelationNew, this.mapSObjAccountContactRelationOld);
	}

		/**
	 * @Author: Everymind
	 * @Date: 01/10/2021
	 * @Description: Método que é executado após exclusão de um registro de AccountContactRelation
	 */
	public override void afterDelete() {
		objBO.removeRelation(this.lstSObjAccountContactRelationNew, this.mapSObjAccountContactRelationOld);
	}
}