           SELECT COD043 ASSIGN TO PATH-COD043
                  ORGANIZATION INDEXED
                  ACCESS MODE IS DYNAMIC
                  RECORD KEY IS CHAVE-CO43 = SEQ-CO43 ITEM-CO43
                  STATUS IS ST-COD043.
      *  CADASTRO DE BRINDES P/ ARQUIVO SIMULADO
      *  COD043 � COMPLEMENTO DO COD042
       FD  COD043.
       01  REG-COD043.
      * SEQ-CO43 QUE FAZ RELACAO COM SEQ-CO42.
           05  SEQ-CO43            PIC 9(3).
           05  ITEM-CO43           PIC 9(2).
           05  BRINDE-CO43         PIC 9(3).
           05  QTDE-BRINDE-CO43    PIC 9(5).
           05  DATA-PAGTO-CO43     PIC 9(8).
      *    DATA-PAGTO-CO43 - AAAAMMDD
           05  CUSTO-PREVISTO-CO43 PIC 9(8)V99.
           05  DEB-CRED-CO43       PIC X.
