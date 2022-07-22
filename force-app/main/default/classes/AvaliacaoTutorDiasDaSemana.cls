public with sharing class AvaliacaoTutorDiasDaSemana {
    public static List<String> verificaDiasNoMes(Integer mes, Integer ano, List<String> dias, Set<Id> setIdTurma) {
        String numeroDiaDaSemana;

        List<String> diasNoMes = new List<String>();
        
        //For de dias para números
        for (Integer i = 0; i < dias.size(); i++) {
            if (dias[i] == 'Segunda-Feira'){
                numeroDiaDaSemana = '1';
            }
    
            else if (dias[i] == 'Terça-Feira'){
                numeroDiaDaSemana = '2';
            }
    
            else if (dias[i] == 'Quarta-Feira'){
                numeroDiaDaSemana = '3';
            }
    
            else if (dias[i] == 'Quinta-Feira'){
                numeroDiaDaSemana = '4';
            }
    
            else if (dias[i] == 'Sexta-Feira'){
                numeroDiaDaSemana = '5';
            }
    
            else if (dias[i] == 'Sábado'){
                numeroDiaDaSemana = '6';
            }
    
            else if (dias[i] == 'Domingo'){
                numeroDiaDaSemana = '7';
            }   

            Datetime d = Datetime.newInstance(Date.newInstance(ano, mes, 1), Time.newInstance(0, 0, 0, 0));
            Integer cont = 0;

            while (cont <= 31) {
                Datetime dia = d.addDays(cont);
                if (dia.month() != mes) {
                    break;
                }

                if(dia.format('u') == numeroDiaDaSemana) {
                    String oneDay = String.valueOf(dia.day());
                    String oneMonth = String.valueOf(dia.month());
                    diasNoMes.add(String.valueOf(dia.day()));
                }
                cont++;
            }
        }   

        //Verifica as datas que existem na chamada além das padrões por mês
        List<Date> oldDatas = new List<Date>();
        for(String diaMes : diasNoMes) {
            Date dataFor = Date.newInstance(ano, mes, Integer.valueOf(diaMes));
            oldDatas.add(dataFor);
        }
        //Adiciona as datas 'extras' na lista
        List<Date> chamadaData = new List<Date>();
        List<String> diaAdicional = new List<String>();
        for(Chamada__c casoChamadaDataAdicional : [SELECT Id, Data__c, Ano__c FROM Chamada__c WHERE Turma__c in:setIdTurma AND Ano__c = :String.valueOf(ano) AND Data__c NOT IN :oldDatas]){
            if(casoChamadaDataAdicional.Data__c.month() == mes && !chamadaData.contains(casoChamadaDataAdicional.Data__c)){
                chamadaData.add(casoChamadaDataAdicional.Data__c);
                if(String.valueOf(casoChamadaDataAdicional.Data__c.day()).length() == 1 && String.valueOf(casoChamadaDataAdicional.Data__c.month()).length() == 1){
                    diaAdicional.add(String.valueOf(casoChamadaDataAdicional.Data__c.day()));
                }else{
                    diaAdicional.add(String.valueOf(casoChamadaDataAdicional.Data__c.day()));
                }
            }
        }

        for(String diaAdicionalFor : diaAdicional){
            diasNoMes.add(diaAdicionalFor);
        }
    
        diasNoMes.sort();
        return diasNoMes;
    }
}