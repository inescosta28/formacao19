public class VisualizacaoContato {
    public contact selectedContact {get;}
    public List<Contact> lstContactsUpdate {get; set;} 
    //public List<Contact> lstContactsInsert {get; set;} 
    public List<aluno> lstAlunos {get; set;} 
    public List<String> lstText {get; set;} 
    public Map<String,List<aluno>> mapCursos {get;set;}
    public Map<String, List<aluno>> mapCursos2 {get;set;}
    
    private String nome {
        get{
            system.debug('get nome - teste');
            return 'zé';
        }
        
        set{
            if(nome=='pilinha')
                nome = 'palavrao';
        }
    }

    public class aluno {
        public string curso  {get;set;}
        public string nome  {get;set;}
        public integer idade  {get;set;}
        public decimal peso  {get;set;}
        public date aniversario  {get;set;}

        public aluno(String nome_x, integer idade_x, date aniversario_x){
            nome =  nome_x;
            idade = idade_x;
            peso = 80;
            aniversario = aniversario_x;
        }

        public aluno(String nome_x, integer idade_x, Decimal peso_x, date aniversario_x){
            nome =  nome_x;
            idade = idade_x;
            peso = peso_x;
            aniversario = aniversario_x;
        }

        public aluno(String nome_x, String curso_x){
            nome =  nome_x;
            curso = curso_x;
        }
    }
    
    public VisualizacaoContato(){ 
        system.debug(' -- VisualizaocaoContato -- ');

        lstAlunos = new List<aluno>();
        lstAlunos.add(new aluno('Maria',12,System.today()));
        lstAlunos.add(new aluno('Maria',12,50,System.today()));

        mapCursos = new Map<String,List<aluno>>();

        List<aluno> lstMkt = new List<aluno>();
        lstMkt.add(new aluno('Maria 1',12,50,System.today()));
        lstMkt.add(new aluno('Maria 2',12,50,System.today()));
        lstMkt.add(new aluno('Maria 3',12,50,System.today()));

        mapCursos.put('Marketing', lstMkt);

        List<aluno> lstInf = new List<aluno>();
        lstInf.add(new aluno('Maria 1',12,50,System.today()));
        lstInf.add(new aluno('Maria 2',12,50,System.today()));
        lstInf.add(new aluno('Maria 3',12,50,System.today()));


        mapCursos.put('Inf', lstInf);

        List<aluno> lstMkt2 = new List<aluno>();
        lstMkt2.add(new aluno('Carvalhinho "ervas"',12,50,System.today()));
        mapCursos.put('Marketing', lstMkt2);

        List<aluno> lstAlunos2 = new List<aluno>();
        lstAlunos2.add(new aluno('Tó 1', 'Mkt'));
        lstAlunos2.add(new aluno('Tó 2', 'Info'));
        lstAlunos2.add(new aluno('Tó 3', 'Cul'));
        lstAlunos2.add(new aluno('Tó 4', 'Info'));
        lstAlunos2.add(new aluno('Tó 5', 'Info'));
        lstAlunos2.add(new aluno('Tó 6', 'Cul'));
        lstAlunos2.add(new aluno('Tó 7', 'Mkt'));
        
        mapCursos2 = new Map<String,List<aluno>>();

        for(aluno selAluno : lstAlunos2){
            List<aluno> selLstAluno;
            if(mapCursos2.containsKey(selAluno.curso)){
                selLstAluno = mapCursos2.get(selAluno.curso);
            } else {
                selLstAluno = new List<aluno>();
            }
            selLstAluno.add(selAluno);
            mapCursos2.put(selAluno.curso, selLstAluno);
        }

        system.debug('mapCursos= ' + mapCursos);
    }


  public void getCursos(){
        system.debug('= Lista de cursos = ' );
        for(String selCurso : mapCursos.keySet()){
            system.debug(selCurso);
        }
    }
    
    public void getAlunosCurso(String Curso){
        system.debug('= Lista de aluno  = Curso de ' + Curso );
        if(mapCursos.containsKey(Curso)){
            for(aluno selAluno : mapCursos.get(Curso)){
                system.debug('Nome do Aluno= ' +  selAluno.nome);
            }
        }
    }

    public void getCursos2(){
        system.debug('= Lista de cursos = ' );
        for(String selCurso : mapCursos2.keySet()){
            system.debug(selCurso);
        }
    }
    
    public void getAlunosCurso2(String Curso){
        system.debug('= Lista de aluno  = Curso de ' + Curso);
        if(mapCursos.containsKey(Curso)){
            for(aluno selAluno : mapCursos2.get(Curso)){
                system.debug('Nome do Aluno= ' +  selAluno.nome);
            }
        }
    }
    
     //private void chamada(){
       //  system.debug('alo');
    // }
    
    //public void resposta(){
    //   system.debug('tô sim');
    // }
}

   /* lstText = new List<String>();
        lstText.add('teste formacao0');
        lstText.add('teste formacao1');
        
        //opcao1
        //List<Contact> lstContactsInsert;
        //lstContactsInsert = new List<Contact>();
        //contact newContact = new contact(lastname='teste');
        //lstContactsInsert.add(newContact);
        //insert lstContactsInsert;
        
        
        //opcao2
        List<Contact> lstContactsInsert = new List<Contact>();
        lstContactsInsert.add(new contact(lastname='teste formacao0'));
        lstContactsInsert.add(new contact(lastname='teste formacao1'));
        lstContactsInsert.add(new contact(lastname='teste formacao2'));
        //insert lstContactsInsert;
        
        //lstContactsUpdate = [SELECT Id, Name, LastName, Department FROM Contact where CreatedDate = today and LastName = 'carvalhinho'];
        lstContactsUpdate = [SELECT Id, Name, LastName, Department FROM Contact where LastName in : lstText];
        
        for(contact selContact : lstContactsUpdate){
            system.debug('Contact name (1) = ' + selContact.LastName);
            //if(selContact.Name == 'teste formacao0')
            selContact.Department = 'Apex 2';      
            system.debug('Contact name (2) = ' + selContact.LastName);
        }
        
        if(!lstContactsUpdate.isEmpty())
            update lstContactsUpdate;	
        chamada();   
        resposta();*/