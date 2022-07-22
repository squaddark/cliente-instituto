public with sharing class porcentagemPresencaBO {

    public static List<alunoTO> presencaAlunosByTurma(String mes, String ano, String turma){
        Integer mesNumber = retornaMesInt(mes);
        Date lDataIni = date.newinstance(Integer.valueOf(ano), mesNumber, 1);
        Date lDataFim = lDataIni.addMonths(1);
        List<Contact> lstAlunos = porcentagemPresencaDAO.getAlunos(turma, lDataIni, lDataFim);
        List<Chamada__c> lstChamadas = porcentagemPresencaDAO.getchamadas(turma, lDataIni, lDataFim); 
        
        List<String> diasAulas = buscarDias(turma, mes, ano);
        List<alunoTO> lstAlunosTO = new List<alunoTO>();

        for(Contact aluno : lstAlunos){
            List<Integer> lstFrenquencia = contarPresencas(lstChamadas, diasAulas, aluno.Id, aluno.DataEntrada__c);
            alunoTO alunoTO = new alunoTO();
            alunoTO.id = aluno.Id; 
            alunoTO.nome = aluno.Name; 
            alunoTO.diasPresente = String.valueOf(lstFrenquencia[0]);
            alunoTO.diasAusente = String.valueOf(lstFrenquencia[1]);
            alunoTO.lstPresenca = verificarChamada(diasAulas, lstChamadas, aluno, mesNumber, Integer.valueOf(ano));
            if(diasAulas.size() != 0){
                alunoTO.porcentagemPresenca = String.valueOf(lstFrenquencia[0]*(100/diasAulas.size()))+'%';
            }else{
                alunoTO.porcentagemPresenca = '0%';
            }
            
            
            lstAlunosTO.add(alunoTO);
        }
        return lstAlunosTO;
    }
    public static List<Integer> contarPresencas(List<Chamada__c> lstChamadas, List<String> diasAulas,  String alunoId, Date dataEntrada){
        Integer presencaNumber = 0;
        Integer faltasNumber = 0;
        List<Integer> lstRetorno = new List<Integer>();

        for(String dia : diasAulas){
            String presenca = '-';
            for(Chamada__c chamada : lstChamadas){
                if(alunoId == chamada.Aluno__C && Integer.valueOf(dia) == chamada.Data__c.day() ){
                    if(chamada.Status__c =='Atestado'){
                        presenca = 'Atestado';
                    }else if(chamada.Status__c =='Falta'){ 
                        presenca = 'Falta';
                    }else if(chamada.Status__c =='Ausente'){ 
                        presenca = 'Ausente';
                    }else if(chamada.Status__c =='Feriado'){ 
                        presenca = 'Feriado';
                    }else if(chamada.Status__c =='Férias'){ 
                        presenca = 'Férias';
                    }else if(chamada.Status__c =='Folga'){ 
                        presenca = 'Folga';
                    }else if(chamada.Status__c =='Jogo'){ 
                        presenca = 'Jogo';
                    }else if(chamada.Status__c =='Presente'){ 
                        presenca = 'Presente';
                    }
                    break;
                }              
            }
            if(presenca=='Presente'){
                presencaNumber+=1;
            }else if(presenca=='Falta'){
                faltasNumber+=1;
            }
        }
        lstRetorno.add(presencaNumber);
        lstRetorno.add(faltasNumber);

        return lstRetorno;
    }

    public static List<String> buscarDias(String turma, String mes, String ano){
        List<String> retorno = new List<String>();
        try {
            Turma__c objTurma = porcentagemPresencaDAO.buscarTurma(turma);
            Set<String> setDias = new Set<String>();
            list<String> listaDias = new List<String>();
            for(GradeHoraria__c item: objTurma.GradesHorarias__r){
                if(!listaDias.contains(item.DiaTreino__c)){
                    listaDias.add(item.DiaTreino__c);
                }
                
            }
            
            //for(String dia : )
            Integer mes2 = retornaMesInt(mes);
            Integer ano2 = Integer.valueOf(ano);

            retorno = diasDaSemana.verificaDiasNoMes(mes2, ano2, listaDias, turma);
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
        return retorno;
    }
    
    public static Integer retornaMesInt(String mes){
        Integer numMes = 0;
        if(mes == 'Janeiro'){
            numMes = 1;
        }
        else if(mes == 'Fevereiro'){
            numMes = 2;
        }
        else if(mes == 'Março'){
            numMes = 3;
        }
        else if(mes == 'Abril'){
            numMes = 4;
        }
        else if(mes == 'Maio'){
            numMes = 5;
        }
        else if(mes == 'Junho'){
            numMes = 6;
        }
        else if(mes == 'Julho'){
            numMes = 7;
        }
        else if(mes == 'Agosto'){
            numMes = 8;
        }
        else if(mes == 'Setembro'){
            numMes = 9;
        }
        else if(mes == 'Outubro'){
            numMes = 10;
        }
        else if(mes == 'Novembro'){
            numMes = 11;
        }
        else if(mes == 'Dezembro'){
            numMes = 12;
        }

        return numMes;
    }

    public static List<String> verificarChamada( List<String> diasAulas, List<Chamada__c> lstChamadas, Contact aluno, Integer mes, Integer ano){
        List<String> presencas = new List<String>();
        for(String dia : diasAulas){
            String presenca = 'SC';
            Date dataAtual = date.newinstance(ano, mes, Integer.valueOf(dia));
            for(Chamada__c chamada : lstChamadas){
                if(aluno.DataEntrada__c >= dataAtual){
                    presenca ='-';
                }
                if(aluno.Id == chamada.Aluno__C && Integer.valueOf(dia) == chamada.Data__c.day() && (chamada.Data__c >= aluno.DataEntrada__c || aluno.DataEntrada__c != null)){
                    if(chamada.Status__c =='Atestado'){
                        presenca = 'Atestado';
                    }else if(chamada.Status__c =='Falta'){ 
                        presenca = 'Falta';
                    }else if(chamada.Status__c =='Ausente'){ 
                        presenca = 'Ausente';
                    }else if(chamada.Status__c =='Feriado'){ 
                        presenca = 'Feriado';
                    }else if(chamada.Status__c =='Férias'){ 
                        presenca = 'Férias';
                    }else if(chamada.Status__c =='Folga'){ 
                        presenca = 'Folga';
                    }else if(chamada.Status__c =='Jogo'){ 
                        presenca = 'Jogo';
                    }else if(chamada.Status__c =='Presente'){ 
                        presenca = 'Presente';
                    }
                    break;
                }
            }
            presencas.add(presenca);
        }

        return presencas;
    }

    public static List<String> listarDias(String turma, String mes, String ano){
        List<String> presencas = new List<String>();
        List<String> lstDias = buscarDias(turma, mes, ano);
        for(String dia: lstDias){
            String nomeDia = 'Dia '+Integer.valueOf(dia);
            presencas.add(nomeDia);
        }
        
        
        return presencas;
    }
    public static List<String> contarTotais(List<String> diasAulas, List<Chamada__c> lstChamadas, List<Contact> lstAlunos, String titulo){
        List<String> retorno = new List<String>();      
        for(String dia : diasAulas){
            Integer faltas=0;
            Integer presencas=0;
            Integer quantAlunos = 0;

            for(Chamada__c chamada : lstChamadas){
                if(Integer.valueOf(dia) == chamada.Data__c.day()){
                    if(chamada.Status__c =='Presente'){ 
                        presencas += 1;
                    }else if(chamada.Status__c =='Falta'){ 
                        faltas += 1;
                    }
                }
            }
            if(titulo == 'Total de presenças/dia'){
                    retorno.add(String.valueOf(presencas));
                }else{
                    retorno.add(String.valueOf(faltas));
                }
            
            }
        return retorno;

    }
    public static List<String> porcentagemTotais(List<String> diasAulas, List<Chamada__c> lstChamadas, List<Contact> lstAlunos, String titulo){
        List<String> retorno = new List<String>();
        for(String dia : diasAulas){
            Integer faltas=0;
            Integer presencas=0;
            Integer quantAlunos = 0;
            for(Contact aluno : lstAlunos){
                if (aluno.dataEntrada__c.day() <= Integer.valueOf(dia)) {
                    quantAlunos +=1;
                }
            }
            for(Chamada__c chamada : lstChamadas){
                if(Integer.valueOf(dia) == chamada.Data__c.day()){
                    //faltas += quantAlunos;
                    if(chamada.Status__c =='Presente'){ 
                        presencas += 1;
                    }else if(chamada.Status__c =='Falta'){
                        faltas += 1;
                    }
                }
            }
            if(quantAlunos > 0){
                retorno.add(String.valueOf(presencas*(100/quantAlunos))+'%');
            }else{
                retorno.add('0%');
            }
            
            }
        return retorno;

    }
    public static String mediaPorcentagem(List<String> diasAulas, List<Chamada__c> lstChamadas, List<Contact> lstAlunos){
        String retorno = '0%';
        Integer contadorChamadas = 0 ;
        Integer somaPorcentagem = 0;
        for(String dia : diasAulas){
            Integer presencas=0;
            Boolean  diaContado = false;
            Integer quantAlunos = 0;
            for(Contact aluno : lstAlunos){
                if (aluno.dataEntrada__c.day() <= Integer.valueOf(dia)) {
                    quantAlunos +=1;
                }
            }
            for(Chamada__c chamada : lstChamadas){
                if(Integer.valueOf(dia) == chamada.Data__c.day()){
                    if(!diaContado){
                        contadorChamadas += 1;
                        diaContado = true ;
                    }
                    if(chamada.Status__c =='Presente'){ 
                        presencas += 1;
                    }
                }
            }
            if(quantAlunos > 0){
            somaPorcentagem += presencas*(100/quantAlunos);
            }
        }
        if(somaPorcentagem > 0 && contadorChamadas > 0){
            retorno = String.valueOf(somaPorcentagem/contadorChamadas)+'%';
        }
        return retorno;

    }
    public static List<ListaTO> listarTotais(String turma, String mes, String ano){
        Integer mesNumber = retornaMesInt(mes);
        Date lDataIni = date.newinstance(Integer.valueOf(ano), mesNumber, 1);
        Date lDataFim = lDataIni.addMonths(1);
        List<Contact> lstAlunos = porcentagemPresencaDAO.getAlunos(turma, lDataIni, lDataFim);
        List<Chamada__c> lstChamadas = porcentagemPresencaDAO.getchamadas(turma, lDataIni, lDataFim);
        List<String> diasAulas = buscarDias(turma, mes, ano);

        Integer quantAlunos = lstAlunos.size();

        List<String> lstTitulo = new List<String>();
        List<ListaTO> retorno = new List<ListaTO>();
        lstTitulo.add('Total de presenças/dia');
        lstTitulo.add('Total de faltas/dia');
        lstTitulo.add('% de presença');
        
        for(String titulo: lstTitulo){
            ListaTO lista = new ListaTO();
            lista.titulo = titulo;
            if(titulo != '% de presença'){
                lista.lista = contarTotais(diasAulas, lstChamadas, lstAlunos, titulo);
                lista.mediaPorcentagem = '-';
            }else{
                lista.lista = porcentagemTotais(diasAulas, lstChamadas, lstAlunos, titulo);
                lista.mediaPorcentagem = mediaPorcentagem(diasAulas, lstChamadas, lstAlunos);
            }
            retorno.add(lista);
        }
        
        
        return retorno;
    }
    


    public class AlunoTO{
        @AuraEnabled
        public String id {get; set;}
        @AuraEnabled
        public String nome {get; set;}
        @AuraEnabled
        public String diasPresente {get; set;}
        @AuraEnabled
        public String diasAusente {get; set;}
        @AuraEnabled
        public String porcentagemPresenca {get; set;}
        @AuraEnabled
        public List<String> lstPresenca {get; set;}
    }

    public class ListaTO{
        @AuraEnabled
        public String titulo {get; set;}
        @AuraEnabled
        public List<String> lista {get; set;}
        @AuraEnabled
        public String mediaPorcentagem {get; set;}

        public ListaTO(){
            lista = new List<String>();
        }
    }
}

/* public static List<String> calcularPorcentagem(String mes, String ano, String turma){

    try {
        Integer anoInt = Integer.valueOf(ano);
        Integer mesInt = retornaMesInt(mes);

        Date dataInicial = date.newinstance(anoInt, mesInt, 1);
        Date dataFinal = date.newinstance(anoInt, mesInt, 31);

        List<String> lstPresencas = new List<String>();

        List<Contact> lstAlunos = porcentagemPresencaDAO.getAlunos(turma);
        List<Chamada__c> lstChamada = [SELECT Id, Status__c, Data__c, TotalPresenca__c FROM Chamada__c 
                                            WHERE Aluno__c = :aluno.Id AND Data__c >: dataInicial AND Data__c <: dataFinal];
                                        
        for (Contact aluno : lstAlunos) {
            Integer contagem = 0;
            Integer porcentagem = 0;
            


            if(!lstChamada.isEmpty()){
                for(Integer i = 0; i < lstChamada.size(); i++){
                    if(lstChamada[i].TotalPresenca__c != 1){
                        contagem = contagem + 0;
                    }
                    else{
                        contagem = contagem + 100;
                    }
                }

                porcentagem = contagem/lstChamada.size();
                lstPresencas.add(porcentagem + '%');
            } else{
                lstPresencas.add('0%');
            }
        }
        System.debug(lstPresencas);
        return lstPresencas;

    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
} */