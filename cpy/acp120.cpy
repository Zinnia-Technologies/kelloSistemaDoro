      $IF SYS-CONSTANTS NOT DEFINED
       01  SYS-CONSTANTS.
           03  SYS-NULL       PIC 9(8) COMP-X VALUE H"01000000".
           03  SYS-CONTROL    PIC 9(8) COMP-X VALUE H"02000000".
           03  SYS-WINDOW     PIC 9(8) COMP-X VALUE H"03000000".
      $END

       01  filler.

       03  PRINCIPAL                       PIC 9(8) COMP-X VALUE 1.
       03  EF1                             PIC 9(8) COMP-X VALUE 2.
       03  PB6                             PIC 9(8) COMP-X VALUE 3.
       03  PB2                             PIC 9(8) COMP-X VALUE 4.
       03  GBOX1                           PIC 9(8) COMP-X VALUE 5.
       03  GBOX5                           PIC 9(8) COMP-X VALUE 6.
       03  PB1                             PIC 9(8) COMP-X VALUE 7.
       03  EF-NUMERO                       PIC 9(8) COMP-X VALUE 8.
       03  EF-CONTRATO                     PIC 9(8) COMP-X VALUE 9.
       03  EF-CIDADE                       PIC 9(8) COMP-X VALUE 10.
       03  EF-NOME                         PIC 9(8) COMP-X VALUE 11.
       03  TAB1                            PIC 9(8) COMP-X VALUE 12.
       03  EF2                             PIC 9(8) COMP-X VALUE 13.
       03  EF3                             PIC 9(8) COMP-X VALUE 14.
       03  MBOX1                           PIC 9(8) COMP-X VALUE 15.
       03  MBOX-ERROS                      PIC 9(8) COMP-X VALUE 16.
       03  MBOX6                           PIC 9(8) COMP-X VALUE 17.
       03  AJUDA                           PIC 9(8) COMP-X VALUE 18.
       03  PB8                             PIC 9(8) COMP-X VALUE 19.
       03  MBOX5                           PIC 9(8) COMP-X VALUE 20.
       03  ORIGINAL                        PIC 9(8) COMP-X VALUE 21.
       03  EF-DOC-ORIG                     PIC 9(8) COMP-X VALUE 22.
       03  EF-PARCELA-ORIG                 PIC 9(8) COMP-X VALUE 23.
       03  SB-TIPO-ORIG                    PIC 9(8) COMP-X VALUE 24.
       03  EF-BANCO-ORIG                   PIC 9(8) COMP-X VALUE 25.
       03  EF-VALOR-ORIG                   PIC 9(8) COMP-X VALUE 26.
       03  EF-VENCTO                       PIC 9(8) COMP-X VALUE 27.
       03  EF-OBS-ORIG                     PIC 9(8) COMP-X VALUE 28.
       03  PB3                             PIC 9(8) COMP-X VALUE 29.
       03  LB1                             PIC 9(8) COMP-X VALUE 30.
       03  EF-SEQ                          PIC 9(8) COMP-X VALUE 31.
       03  NOVOS                           PIC 9(8) COMP-X VALUE 32.
       03  EF-DOC-NOVO                     PIC 9(8) COMP-X VALUE 33.
       03  EF-PARCELA-NOVO                 PIC 9(8) COMP-X VALUE 34.
       03  SB-TIPO-NOVO                    PIC 9(8) COMP-X VALUE 35.
       03  EF-BANCO-NOVO                   PIC 9(8) COMP-X VALUE 36.
       03  EF-VALOR-NOVO                   PIC 9(8) COMP-X VALUE 37.
       03  EF-VENCTO-NOVO                  PIC 9(8) COMP-X VALUE 38.
       03  EF-OBS-NOVO                     PIC 9(8) COMP-X VALUE 39.
       03  PB4                             PIC 9(8) COMP-X VALUE 40.
       03  EF10                            PIC 9(8) COMP-X VALUE 41.
       03  LB2                             PIC 9(8) COMP-X VALUE 42.
       03  INFORMACAO                      PIC 9(8) COMP-X VALUE 43.
       03  EF-OBSERVACAO1                  PIC 9(8) COMP-X VALUE 44.
       03  EF-OBSERVACAO2                  PIC 9(8) COMP-X VALUE 45.
       03  EF-OBSERVACAO3                  PIC 9(8) COMP-X VALUE 46.
       03  EF-OBSERVACAO4                  PIC 9(8) COMP-X VALUE 47.
       03  EF-OBSERVACAO5                  PIC 9(8) COMP-X VALUE 48.
       03  EF-OBSERVACAO6                  PIC 9(8) COMP-X VALUE 49.
       03  EF-OBSERVACAO7                  PIC 9(8) COMP-X VALUE 50.
       03  EF-OBSERVACAO8                  PIC 9(8) COMP-X VALUE 51.
       03  EF-OBSERVACAO9                  PIC 9(8) COMP-X VALUE 52.
       03  EF-OBSERVACAO10                 PIC 9(8) COMP-X VALUE 53.
       03  DATAS                           PIC 9(8) COMP-X VALUE 54.
       03  EF-DATA-EMITENTE                PIC 9(8) COMP-X VALUE 55.
       03  DEPOSITO                        PIC 9(8) COMP-X VALUE 56.
       03  EF-DTDEP1                       PIC 9(8) COMP-X VALUE 57.
       03  EF-AGENCIA1                     PIC 9(8) COMP-X VALUE 58.
       03  EF-VLRORIG1                     PIC 9(8) COMP-X VALUE 59.
       03  EF-JUROS1                       PIC 9(8) COMP-X VALUE 60.
       03  EF-DESCONTO1                    PIC 9(8) COMP-X VALUE 61.
       03  EF-VLRTOTAL1                    PIC 9(8) COMP-X VALUE 62.
       03  EF-DTDEP2                       PIC 9(8) COMP-X VALUE 63.
       03  EF-AGENCIA2                     PIC 9(8) COMP-X VALUE 64.
       03  EF-VLRORIG2                     PIC 9(8) COMP-X VALUE 65.
       03  EF-JUROS2                       PIC 9(8) COMP-X VALUE 66.
       03  EF-DESCONTO2                    PIC 9(8) COMP-X VALUE 67.
       03  EF-VLRTOTAL2                    PIC 9(8) COMP-X VALUE 68.
       03  EF-DTDEP3                       PIC 9(8) COMP-X VALUE 69.
       03  EF-AGENCIA3                     PIC 9(8) COMP-X VALUE 70.
       03  EF-VLRORIG3                     PIC 9(8) COMP-X VALUE 71.
       03  EF-JUROS3                       PIC 9(8) COMP-X VALUE 72.
       03  EF-DESCONTO3                    PIC 9(8) COMP-X VALUE 73.
       03  EF-VLRTOTAL3                    PIC 9(8) COMP-X VALUE 74.
       03  EF-DTDEP4                       PIC 9(8) COMP-X VALUE 75.
       03  EF-AGENCIA4                     PIC 9(8) COMP-X VALUE 76.
       03  EF-VLRORIG4                     PIC 9(8) COMP-X VALUE 77.
       03  EF-JUROS4                       PIC 9(8) COMP-X VALUE 78.
       03  EF-DESCONTO4                    PIC 9(8) COMP-X VALUE 79.
       03  EF-VLRTOTAL4                    PIC 9(8) COMP-X VALUE 80.
       03  GBOX2                           PIC 9(8) COMP-X VALUE 81.
       03  GBOX3                           PIC 9(8) COMP-X VALUE 82.
       03  GBOX4                           PIC 9(8) COMP-X VALUE 83.
       03  GBOX6                           PIC 9(8) COMP-X VALUE 84.
       03  GBOX7                           PIC 9(8) COMP-X VALUE 85.