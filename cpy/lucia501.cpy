           SELECT  COD501 ASSIGN TO PATH-COD501
                   ORGANIZATION IS INDEXED
                   ACCESS MODE IS DYNAMIC
                   STATUS IS ST-COD501
                   LOCK MODE IS MANUAL WITH LOCK ON RECORD
                   RECORD KEY IS CHAVE-CO501 =
                      NR-CONTRATO-CO501 ITEM-CO501 SUBITEM-CO501.
      *   arquivo de contatos do contrato - cont-cod500
       FD  COD501.
       01  REG-COD501.
           05  NR-CONTRATO-CO501  PIC 9(4).
           05  ITEM-CO501         PIC 9(2).
           05  SUBITEM-CO501      PIC 9(2).
           05  ANOTACAO-CO501     PIC X(80).
