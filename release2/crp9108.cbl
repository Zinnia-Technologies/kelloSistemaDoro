       copy dslang.cpy.
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    CRP9108.
       AUTHOR.        ALFREDO SAVIOLLI NETO.
      *GERA ARQUIVO REMESSA P/ BANCO DO BRASIL (EDA)
       DATE-WRITTEN.  18/06/05.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA
                      PRINTER IS LPRINTER.
       class-control.
           Window             is class "wclass".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CAPX010.
           COPY CAPX002.
           COPY CAPX018.
           COPY CRPX020.
           COPY CGPX010.
           COPY CGPX011.
           COPY CGPX014.
           COPY CRPX200.
           COPY CRPX201.
           COPY RETPORT.SEL.
           COPY LOGACESS.SEL.
           SELECT SEQBRAS ASSIGN TO PATH-SEQBRA
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-SEQ
                  RECORD KEY IS CONT-SEQUENCIA.
           SELECT REMESSA ASSIGN TO REMESSA-NOME
                  ORGANIZATION IS LINE SEQUENTIAL
                  ACCESS MODE IS SEQUENTIAL.
           SELECT REMESSA2 ASSIGN TO REMESSA-NOME2
                  ORGANIZATION IS SEQUENTIAL
                  ACCESS MODE IS SEQUENTIAL.
           SELECT WORK ASSIGN TO VARIA-W
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-WORK
                  RECORD KEY IS SEQ-WK
                  ALTERNATE RECORD KEY IS NOME-WK WITH DUPLICATES.
           SELECT RELAT ASSIGN TO PRINTER NOME-IMPRESSORA.

       DATA DIVISION.
       FILE SECTION.
       COPY CAPW002.
       COPY CAPW010.
       COPY CAPW018.
       COPY CRPW020.
       COPY CGPW010.
       COPY CGPW011.
       COPY CGPW014.
       COPY CRPW200.
       COPY CRPW201.
       COPY RETPORT.FD.
       COPY LOGACESS.FD.
       FD  SEQBRAS.
       01  REG-SEQBRAS.
           05  CONT-SEQUENCIA  PIC 9.
           05  SEQUENCIA       PIC 9(10).
       FD  REMESSA.
       01  REG-REMESSA.
           05  ID-REG-REM       PIC X(02).
           05  DADOS-REM        PIC X(498).
       FD  REMESSA2
           label record is omitted.
       01  REG-REMESSA2.
           05  ID-REG-REM2      PIC X(02).
           05  DADOS-REM2       PIC X(498).
           05  pula-rem2        pic x(02).

       FD  WORK.
       01  REG-WORK.
           05  SEQ-WK           PIC 9(3).
           05  NOME-WK          PIC X(35).
           05  ENDERECO-WK      PIC X(35).
           05  CEP-WK           PIC 9(8).
           05  CIDADE-WK        PIC X(15).
           05  UF-WK            PIC XX.
           05  DOCTO-WK         PIC X(10).
           05  VALOR-WK         PIC 9(8)V99.
       FD  RELAT
           LABEL RECORD IS OMITTED.
       01  REG-RELAT.
           05  FILLER          PIC X(132).
       WORKING-STORAGE SECTION.
           COPY IMPRESSORA.
           COPY "CRP9108.CPB".
           COPY "CRP9108.CPY".
           COPY "DS-CNTRL.MF".
           COPY "CBPRINT.CPY".
       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  AREAS-DE-TRABALHO.
           05 ERRO-1              PIC XX     VALUE SPACES.
           05 ST-CAD002           PIC XX     VALUE SPACES.
           05 ST-CAD010           PIC XX     VALUE SPACES.
           05 ST-CAD018           PIC XX     VALUE SPACES.
           05 ST-CRD020           PIC XX     VALUE SPACES.
           05 ST-REM              PIC XX     VALUE SPACES.
           05 ST-CGD010           PIC XX     VALUE SPACES.
           05 ST-CGD011           PIC XX     VALUE SPACES.
           05 ST-CGD014           PIC XX     VALUE SPACES.
           05 ST-CRD200           PIC XX     VALUE SPACES.
           05 ST-CRD201           PIC XX     VALUE SPACES.
           05 FS-RETPORT          PIC XX     VALUE SPACES.
           05 FS-LOGACESS         PIC XX     VALUE SPACES.
           05 ST-SEQ              PIC XX     VALUE SPACES.
           05 ST-WORK             PIC XX     VALUE SPACES.
           05 VARIA-W             PIC 9(8)   VALUE ZEROS.
           05 VALOR-W             PIC 9(11)V99 VALUE ZEROS.
           05 TIPO-W              PIC 99     VALUE ZEROS.
           05 SEQ-W               PIC 9(6)   VALUE ZEROS.
           05 AUX-TIPO-DOCTO      PIC X(20)  VALUE SPACES.
           05 MENSAGEM            PIC X(200).
           05 TIPO-MSG            PIC X(01).
           05 RESP-MSG            PIC X(01).
           05 SENHA               PIC 9(04)  VALUE ZEROS.
           05 OPCAO               PIC 9      VALUE ZEROS.
           05 DATA-DIA            PIC 9(6)   VALUE ZEROS.
           05 DATA-DIA-I          PIC 9(8)   VALUE ZEROS.
           05 HORA-BRA            PIC 9(8)   VALUE ZEROS.
           05 ULT-SEQ             PIC 9(5)   VALUE ZEROS.
           05 DATA-E             PIC 99/99/99.
           05 REMESSA-NOME        PIC X(12)  VALUE SPACES.
           05 SEQUENCIA-W         PIC 9(10)     VALUE ZEROS.
           05 VALOR-ATRASO        PIC 9(11)V99 VALUE ZEROS.
           05 COD-COMPL-CR20-W    PIC 9(09)  VALUE ZEROS.
           05 CONF                PIC X      VALUE SPACES.
           05 VALOR-TOTAL         PIC 9(12)V99 VALUE ZEROS.
           05 QTDE-TIT            PIC 9(4)     VALUE ZEROS.
           05 ERRO-W              PIC 9        VALUE ZEROS.
           05 DATA-INV            PIC 9(8)     VALUE ZEROS.
           05 VENCTO-INI-INV      PIC 9(8)     VALUE ZEROS.
           05 VENCTO-FIM-INV      PIC 9(8)     VALUE ZEROS.
           05 MOVTO-INI-INV       PIC 9(8)     VALUE ZEROS.
           05 MOVTO-FIM-INV       PIC 9(8)     VALUE ZEROS.
           05 TAXA-JUROS          PIC 9(03)V99 VALUE ZEROS.
           05 LIN                 PIC 9(02)    VALUE ZEROS.
           05 IND                 PIC 9(02)    VALUE ZEROS.
           05 TOTAL               PIC 9(4)     VALUE ZEROS.
           05 VALOR               PIC 9(4)     VALUE ZEROS.
           05 RESTO               PIC 9(2)     VALUE ZEROS.
           05 AUX-TIPO            PIC 9(1)     VALUE ZEROS.
           05 DIGITO-VERIFICADOR  PIC X(1)     VALUE SPACES.
           05 DATAW.
              10  DIA-W       PIC 99.
              10  MES-W       PIC 99.
              10  ANO-W       PIC 99.
           05 DATA-W REDEFINES DATAW PIC 9(6).
           05 DATAI.
              10  ANO-I       PIC 99.
              10  MES-I       PIC 99.
              10  DIA-I       PIC 99.
           05 DATA-I REDEFINES DATAI PIC 9(6).
           05 REM-TIPO0.
              10  TIPO-INSC-T0              PIC X(02) VALUE SPACES.
              10  INSC-T0                   PIC X(14) VALUE SPACES.
              10  NOME-EMP-T0               PIC X(30) VALUE SPACES.
              10  TIPO-ARQUIVO-T0           PIC X(06)  VALUE SPACES.
              10  BRANCO1-T0                PIC X(446) VALUE SPACE.
           05 REM-TIPO1.
              10  CONVENIO-T1               PIC 9(06) VALUE ZEROS.
              10  CARTEIRA-T1               PIC 9(02) VALUE ZEROS.
              10  VARIACAO-T1               PIC 9(03) VALUE ZEROS.
              10  SEU-NUMERO-T1             PIC X(10) VALUE SPACES.
              10  NOSSO-NUMERO-T1           PIC X(20) VALUE SPACES.
              10  CONTROLE-T1               PIC X(25) VALUE SPACES.
              10  SIGLA-ESPECIE-T1          PIC X(05) VALUE SPACES.
              10  DATA-EMISSAO-T1           PIC 9(08) VALUE ZEROS.
              10  DATA-VENCTO-T1            PIC 9(08) VALUE ZEROS.
              10  VALOR-TITULO-T1           PIC 9(13) VALUE ZEROS.
              10  CODIGO-MOEDA-T1           PIC X(05) VALUE SPACES.
              10  QUANTIDADE-MOEDA-T1       PIC 9(13) VALUE ZEROS.
              10  ACEITE-T1                 PIC X(01) VALUE SPACES.
              10  VALOR-JUROS-T1            PIC 9(13) VALUE ZEROS.
              10  DATA-LIMITE-DESC-T1       PIC 9(08) VALUE ZEROS.
              10  VALOR-DESCONTO-T1         PIC 9(13) VALUE ZEROS.
              10  VALOR-ABATIMENTO-T1       PIC 9(13) VALUE ZEROS.
              10  QUANTIDADE-DIA-PRO-T1     PIC 9(02) VALUE ZEROS.
              10  MENSAGEM-T1               PIC X(40) VALUE SPACES.
              10  CONVENIO7-POS-T1          PIC 9(09) VALUE ZEROS.
              10  CODIGO-MULTA-T1           PIC 9(01) VALUE ZEROS.
              10  DATA-MULTA-T1             PIC 9(08) VALUE ZEROS.
              10  VALOR-MULTA-T1            PIC 9(13) VALUE ZEROS.
              10  FILLER-T1                 PIC X(09) VALUE SPACES.
              10  TIPO-INSCRICAO-AVAL-T1    PIC X(02) VALUE SPACES.
              10  INSCRICAO-AVALISTA-T1     PIC X(14) VALUE SPACES.
              10  NOME-AVALISTA-T1          PIC X(37) VALUE SPACES.
              10  PENDENTE-IMPRESSAO-T1     PIC X(01) VALUE SPACES.
              10  TIPO-INSCRICAO-CLI-T1     PIC 9(02) VALUE ZEROS.
              10  INSCRICAO-CLIENTE-T1      PIC X(14) VALUE SPACES.
              10  NOME-CLIENTE-T1           PIC X(37) VALUE SPACES.
              10  ENDERECO-CLIENTE-T1       PIC X(37) VALUE SPACES.
              10  CEP-CLIENTE-T1            PIC 9(08) VALUE ZEROS.
              10  CIDADE-CLIENTE-T1         PIC X(15) VALUE SPACES.
              10  UF-CLIENTE-T1             PIC X(02) VALUE SPACES.
              10  ESTADO-DESCRICAO-T1       PIC X(40) VALUE SPACES.
              10  DATA-PAGAMENTO-T1         PIC 9(08) VALUE ZEROS.
              10  VALOR-PAGO-T1             PIC 9(13) VALUE ZEROS.
              10  TIPO-MODALIDADE-T1        PIC 9(02) VALUE ZEROS.
              10  ESTADO-DO-TITULO-T1       PIC 9(02) VALUE ZEROS.
              10  USO-DO-BANCO-T1           PIC X(16) VALUE SPACES.
           05 REM-TIPO2.
              10 QUANTIDADE-T2     PIC 9(06)  VALUE ZEROS.
              10 BRANCO-T2         PIC X(492) VALUE SPACES.

           05  EMP-REFERENCIA.
               10  FILLER            PIC X(15)
                   VALUE "\PROGRAMA\KELLO".
               10  VAR1              PIC X VALUE "\".
               10  EMP-REC           PIC XXX.
               10  VAR2              PIC X VALUE "\".
               10  ARQ-REC           PIC X(10).
           05  EMPRESA-REF REDEFINES EMP-REFERENCIA PIC X(30).
           COPY "PARAMETR".

       77 janelaPrincipal              object reference.
       77 handle8                      pic 9(08) comp-x value zeros.
       77 wHandle                      pic 9(09) comp-5 value zeros.

       01  MASC-DIA                 PIC Z9.


       01  CAB01.
           05  FILLER               PIC X(115) VALUE
           'RELATORIO DE REMESSA - BANCO DO BRASIL'.
           05  FILLER               PIC X(09) VALUE 'EMISSAO: '.
           05  EMISSAO-REL          PIC 99/99/99.
       01  CAB02.
           05  FILLER               PIC X(132) VALUE ALL "=".
       01  CAB03.
           05  FILLER               PIC X(132) VALUE
           "NOME                                ENDERECO
      -    "            CEP       CIDADE          UF DOCUMENTO
      -    " VALOR".
       01  LINDET.
           05  NOME-REL             PIC X(35) VALUE SPACES.
           05  FILLER               PIC X     VALUE SPACES.
           05  ENDERECO-REL         PIC X(35) VALUE SPACES.
           05  FILLER               PIC X     VALUE SPACES.
           05  CEP-REL              PIC ZZZZZ.ZZZ.
           05  FILLER               PIC X     VALUE SPACES.
           05  CIDADE-REL           PIC X(15) VALUE SPACES.
           05  FILLER               PIC X     VALUE SPACES.
           05  UF-REL               PIC XX    VALUE SPACES.
           05  FILLER               PIC X     VALUE SPACES.
           05  DOCTO-REL            PIC X(11) VALUE SPACES.
           05  FILLER               PIC X     VALUE SPACES.
           05  VALOR-REL            PIC ZZ.ZZZ.ZZZ,ZZ.
       01  LINDET1.
           05  FILLER               PIC X(20) VALUE 'VALOR TOTAL.: '.
           05  VALOR-TOTAL-REL      PIC ZZ.ZZZ.ZZZ.ZZZ,ZZ.
           05  FILLER               PIC X(20) VALUE SPACES.
           05  FILLER               PIC X(20) VALUE 'QTDE TITULOS: '.
           05  QTDE-TIT-TOTAL-REL   PIC ZZ@�s�;J0V ȴ%�    �       A�0�d �-�   �  �0����0� 0�(�    �       �� 0�m ��    �       ��0n ��    �       ��0�g 0�    �       ��0�� �*�    �       ��0	} ��c   �  1"��c0�� HL)�    �       ��0�O  ��s�    �       �n0� �7y�8�       �2 ��0i�  �_��    �  x���$�0�  �� �    �       902  ��    �       ��	00� x��    �  H���g�0C� `G��   �  �"��o�0%  ���    �        Q0n�  P��    �       0�G ��    �       �0�� ���    �       e}0AY
  9 ��(    �   Ӿ  �0ga  � v�    �       :�0T  �o�    �       �0ĺ �K �F�    �   R�  ZG0� �� ��    `   d� d�0�0  �M�    �       ��0ɷ  �4�P   �   �5�9%0��  P$�    �       ��0b �9���   �  ��̉@�0�p h���   �  `�Q�|�0K
 H�-��   �  $���0C/ �r�    �       *�0��  '�    �       @0�z ��    �       ű0� 8��    �       .0ҷ ��m���   �  @�/��60s� ���    �       	0r ��5
   �  ��	�>�0�a ��%�    �       ��0�h �!�Tj   �  \Ћ^0�� ��2�    �       k,0%   ��    �       �0%  @��    �       �	0�t  N���   �  (�g�y0ۢ	 ظ���:   �  ��=�U�0� p��ڜ   �  �H�i�0f'  8��    �       ��0� ������   �  �����
0�
 7�    �       �	0�2	 ��   �  𞩋��0�o `�    �  [t�IY	01�	 �@���   �  `�Y�0 ���    �       5�0=  h��    �       00�� �h"���   �  ��20�� X����	   �  �ם�?m0�  ��    �       ��0J  �^�    �       [0�� ��s�r�   �  p@��
0*� P���v   �  �����
0�E �
�^{
   �  �1��5�0e ���ݾ    �  h�S�v)0n� аm�)<   �  (-g��0+�    �    �       g0�  о�    �       ��0e[ ����   �  ��	�
 0�Z �T�3
   �  `1����02
0�  � �    `       c�0�x  ��    �  ������0ٵ (�,�3	   �  y6�=�
0�o ��G�2D   �  � G���0� (��    �       8�	0C� �3��   �  ��}��j0B   ��    �       $�0�� L ���	    �   ��  ϗ0D~ ���    �  �{u���0�  `� �    `       ��0� ���q   �  �����K0C  �� �    �       �H0��  ���    �       dQ0�� p��    �       �`0}C 8(�    �  `�����0� �MB�{�   �   ���#90Kl pv��   �  `���S�0tm �(��
8   �  hxɋQ�0M  �Ա�"	   �  @�:��Z0o  � �    �       E 0v� @��    �       Ԋ0�  ��    �       QZ0� x��    �       �0� (
�!4   �  �1��v�0��  �2�    �       �0� �P�d   �  �1��A�0Ԇ �    �       ��	0�   Z�    `       v0�H �p�'{   �  �Y\�O�0�  �U,�    	�       ��	0"�  2�    �       f0q�
 H����   �  ��	� 0z� �3�    �       ]�0B� h��    �       �_0�p �=�    �       �0�� н�K   �  ��I�9�0�� �����   `  ����SA0�^	 ��	�/�    �  2��k�03# �#��0D   �   ��8f0��  è��   �  h�S�:F0t ��
�    �       tQ0�  �j�    �       U�0x
  0��    �       ?0v� �9	��c   �  2���0(  8\�    �       f�0�� p�8F   �  H~
0��
  #�k   �  ������0�o x���:	   �  Џ҉
 ���B�   �  hxɋ�01o  ���    �       (#
0� ���    �       ��0� �t�    �       \}0$� p��A�   �  ����q_0�� ȳ,��   �  y6���0 8���f    �   � �0|  � �            �[0�R ��    �       K�0   D`�    �       ʦ	0k  ��q�8    �       '�0�& @1r�    �        �0/ 0}$�    �       �0� �a2�    �       ��0LP  �    �       �?0�  �u�    �       �I
0a  �_>�    �        w0
A��	   �  ��<�3 0�� `x���   �  ��f�� 0m `,,���   `  Xv���0�  ����    �  03`�|�0W>  x|�    �       <�	0n  @
 �    �       �(00 �=���	   �  P<h��:0�C X����   �  �|W���0|E �1��P   �  ��}��j0]� �z!�    �       �p0�5 h�    �       ?�0� '�    �       v�0| ��    �       J�02  x3�    �       �0% �&� �
   �  �eދ.�0"�  �]�    �       ��0�  �tJ�    `   �܉C�0�  �;�    �       �0�  xi�    	�       �0�I ��:�'�   �  H*:�� 0 �� ��P    `   O�  L�	0  �"^�    �       �0,	 ����Ք   �  ��׋��0K  ��    �       ��0��	 h����	   `  ��e�j�0�i X0;�   �  x$6��~05  P��    	�       w�0q| p�{�/"   �  �r��b�0c� ��oZ   �  ��	� 01 @���    �   7 y�0�Z �%�    �       �u08� `6��^   �  P<h��:0�
��    �   D�  ��0/� Hq�    �       )0�E  v�    �       w�0=� ((;���   �  ��\�I�0l�  `ٷ�       �J���0�  �! �     �   �� n"0��  0�p�    �  h=d��<0ޠ  8r�    �       -0�� �&�    �       >�0  �)I�       �n���#0
0�� ��&�    �       ��
0�4 (��   �  ��	�0G ��S�^   �  ��4B0HE  o��   �  H_P��a0	� ����   �  �0F�|T0(�  ��    �       ��0%a Y�    �       
�0�l �A�ح   �  8�����0�  �_�    �       ��0B� (J(�    �       �j0u  � �    �       �0~  ��ο    �  0�����0û X��    �       [�0    `�    �       JO0�� x��Ѫ   �  x-!���0@� pm!�    �       
A��   �  ��<�3 0�  8��    �       ��0�� ���    �       I�
0�Z H,�    �       �0[)	 hb:��0   �  H*:�= 0  ���    �       ��0�� �R���   �  1"��00A �@�    �       '�02  �� �    `       lx0 � �z���
   �  �>{���0&$  �+�    �       
q0� PK���   �  ������0�w ذ��!n   �  ��:��b0�  ���    �       5n0�; �z�c�	   �  �����0� ���    �       E60�i p��    �       &80�
 h ��    �  �����0�} غ�    �       J�0�� �<�    �  �����0��  `���z   �  �!�ď0�n ���uR   �  hxɋ��0!� hw�    �       �0�� HC�    �       ��0g� �0�    �       ��00y
 H���n�   �  `�U�/Y01� ����'
   �  �O�Af0� �� ��	    `    �N0�� 8pw���   �  (�T�+00�  �]�    �       f�0�5 �    �       ?�0o� 8�*�    �       �"0*� pv�    �       �k	0Uj `�1�    �       *07� P)�    �       �0�  �U;�    �       ��0�y  �i�    �       V0
�    �        �0�k ���    �       �>0�  �� �    �       �0j ��
ₙ   �  �1��:�0�. �k�y   `   GO��/0w	  H�-   �  � G���0p  �� �    `       p�
0�  ���    �       �0�� �s�AG   �  p@��
0p� (�    �       K�01� �_��    �  x���$�0�  (�:�[�   �  H*:�E 0DM xi%�    �       *�
0��  �g�    �       %M0t� `�2�    �       ��0�� ����A   �  P!��0�� (��    �       0�  �a�    `  pg��{�0* �,�    �       ��0�, �1 ��
    �   �  �e0N 8+��1   �  ������0-  (�;�    �       �H	0� �7�    �  Ћ�
�0�| P�V�ή   �  ذ�R0q� �.�    �  [t��-0  ��%�    �       U�0Cr H2�    �       ��	0!�  ���    �  ����T�0� �33�    �       Y�0�  (F	�    �       �00<� ���    �       /=0   Ȑ�    	�       %�	0�# X�S���   �  ��4B0Y] xM�>   �  `1��P�0�� 8	'�    �       ��0   (0`�    �       ��0�� p8*�    �       ��0c ���c�    �   L r50�  0^�    �       ��0  �X�    �       90�  p�<�     �   -�  �0�  ����    	�       ��0�� ���$5    �    c�0'� @ܸ⤶
   �  ���`�
0�  ����    	�       �B0� �#�    �       ��0��  �$�    �       ��0�  �w �    �       Ry0( �T��Z   �  `1����0�b h0���   �  �6^�$�0,F 8<.��
   �  �#����0�� ��    �       ��	0�8  h�    �  �����0�>  P��    �       �J0d   X�;�    �       �O0�� �&�    �       �d
0� �=�    �       �0�  ���    �       Ko0�:
 0Η��    `  ����0�)  0��    �       ?�0�  8��    �       ��0&} ���    �        �0�  0":�    �       RU0� ���    �       /=0}� �i�    �       3�0�$  ���    �       o0�g %�    �       ��0_� �	�    �       0�   �^�    �       ��	0Ln  hV�    �       �y0-  �^�    �       t>0�
 �|�A    �   -� �

0Đ
 @���    �   R� �A0�  `h�    	�       �0Hg �<���      Pc��0��  	�    �  @�s�y�0� ����(   `  ��f���0 Б�S   �  ��	� 0��  �Z�    �       �y0v pY2�    �       �"0�b  �
0�8 H�,�    �       ��0KT �����   �  hxɋ��0Mz  8
�    �       �n0�  X��    �       ��0	  `��    �       ��	0�e ��    �       ��0�
0[� �gw��    �     ZO0�� ��    �       X�0�@  ���    �       �c0�  pE�    �       n�0_� 8v�U)   `  HRU���0�  �h�    �  ������0�I ���8   �  ����D�0�  ��    �       �{0c� @�{��   �  �r��b�0��
 X�-�j   �  �#��Y�0P �E�    �       �0�� ���    �       ��0�*  �S�    �       #�	0 `A�    �       ��0o x*�    �       ��0B+ 8��   �  ����\�0   �/`�    �       e70�O �s�    �       ��0�  �� �    `       ��0�  K�    �       !�0�% P���^
   �  0�����0� 0_+�    �       7�0u1 ��M�   �  �����
0f� H��v\    �   N�  ;�0/L �6
 ������   �  ����͔0Jc ��>��3   �  xBщPF0$ (�+�    �       �m0h� 0���P      �&t���0.   p�    �       |�0� ��+�    �       �70� ���    �       ��0P 0�%�    �       #!
0�a  ��    �       w�0�� R��    �  (�p�9�0�
    �   ��  �
 (�?��
   �  �{��n0ih P�1�    �       &
0?Y �@�>�   �  8�����0X� ��y�V;   �  (o��	V
0K� `6�    �       h�0�� G�    �       ��0
@  �$�    �       �~0\, ���]   �  �����
0٢ �v �    �       ��04 x���=   `  �/V��0"m ((�    �       ��0�6  �,�    �       �+
0b�	 �p�4   �  ��}��1
0"� �D���   �  hxɋS�0� ���    �       �0� �+�    �       �m0�   �� �    �       i�0&� m���   �  X�/���0�  x�;�    �       �0�  P� �    �       �0��	 �C��   �  p�9���0�. Pp-�eR   �  ��؈Җ0k
 �i�    �   x� B0�) X2�    �       �
0.� ��*    �  �0����0%� ���    �       �#0*� ��    �       @0^�
 P
0�)  �+�    �       �F04  �Q�    �       m`0  �^�    �       �0�  ��    �       ?0P� Xp�    �       6_0 `��<   �  @/�>�0� ���Z�   �  �����0+ ��� �   �  ��׋[�0�E 87���L   �  hxɋR�0\� X�*�    �       [w0L ��*�    �       �X0�� �T�j
   �  `1����0�  �{�    �       |�0�� 8���	   �  ��5�zN0� 8�
�    �       g�0�  P��    �       r0ʖ ȷ,�^(   �  y6���0�  �>��
q   `  /e���0M� (��`
   �  ���(�0�  �g �    �       �p
0O, hb���Q   �  hxɋU�06  0� �    �       �0=  ��"�    `  J�C0�  8&��    	�       0� @���   �  �a���0�	 xA��	   �  ��<�3 0I  H� �    `       #�0��  �`�    �       %M0Ki (N�    �       �.0�  � �    �        Q0T[  �    �       dC0�i ��1�    �       *0 ��h�f   �  ��d0�y ��*��   �  ؑ6�,� 0�9 (;h��^   `  ��+�x00N� �L�    �       90� pb�    �       ��0a� (���	   �  ������0�m ���    �       ��0�; 	s�    �       ?�0� ��f�!
   `  �j��8
0�� �W⢉   �  �1��A�0�� �P�    �       �0C  0{��    	�       E�0��  ��    �       ��0]"   ��    �       �w0�&  �	�    �       O_0�  X#�    	�       h0�. C,�    �       
�	0Ȼ  �r�    �       �0�  �{�    �       |�0,  0^�    �       ��0d# ���    �       Kj	0��  X
   ��?�     �   �,  0�0�M �@
�    �       aD05� ȓ�    �       �q	0  �� �    �       s�07� @����   �  �eދu�0`o  8��    �       ͺ0p[ :�    �       )�0��  �&�    �       ��0
   �  H*:�= 0�  @�    �       �0�    � �    �       İ0�g �Ş⯷   �  ����͔07A ���x�   �  ��׋��08� �� �	�    �   � �|0�= T�G�   �  H$����0O�  �    �       �?0�&  ���    �       W�0�  h\�    �       ��0N �����   �  Hc;�g�0�� ��ፐ
   �  hxɋ��0Q�	 ����M   �   w���0  �|��    `  ��@	0��  8p�    �       u�0O8 п$�    �       	l0~ 0?�    �       0�0U ���SE	   �  �7�_�
0�� �L
�V�   �  �1����0�  �
�     �   1m  �H0}�  H��   �  � G��0�  ���    �       00�
 ��    �       �0�p A���=   �  P֚� �0�
 p���x�   �  ����I�0�G 8��8   �   �f�	0�8	 P��C�   �  P�É�
0�  Ȭ �    �       �T
0�  ���    	�       ��0� ���    �       ߥ0�  �� �    �       ��0�� �@����   �   
  ��    �       E�0��  `��    �       �T0�  8R�    `       v0
   `  �=��l�0N  � �    �       ��0�C 0�    �       ��0̳ �h���   �  �ÉF0��  ѷᔺ   �  ЏB�<�0=�  �%	�    �  @�s�:�0&  � �    �       �F0�� ^*�    �       L<
0�� (�S��    �  ���A0�� �(�    �       MY0�] 8,┸   �  (�����0T9  �    �  (�����0�  � �    �       O�
0d�  ��	�    �  2����0/ �+�    �       ��0�D ��,�    �       D 0�	  � �    �       W�04 P��    �       �20� P-�V�   �  $��J�0��  �*�    �       [w0�� XA��	   �  ��<�3 0Q ؆%�    �       #!
0~
  � �    �       �?0�` ����[�
   �  8*��
0�� � �    �       v�0aF x1�    �       ��0  ��     �   7� �d0�_ @]�    �       ��0� ���    �       �#0�$ p~�    �       {�0g  h� �    `       }�0�� p �    �       �0� �Nⷜ   �  H��� �0�   ��    �       gR0�� �1���   �   a��E0y�  ؟	�    �  2��e�0K� `��    �       ��0�� ���    �       ��0��   /�    �       �
0:�  �M�;�   �  ��b���0�� `P��3;   �  hxɋT�0mc �p4�l�   �  xjr�9�0�   �
0� X�+�    �       �70:� @8ⷊ   �  �1����0�  ����    	�       ��0�  5"�    �       A�0�d �����    �   ��  |�0[  �M��   �  �����
� �1 �    �       a0+d �q�    �       ��0D� �  �    �       h0  ��    �       eh05� �S�    �       F�0u� �"�    �       j
0-(  h��    �       W�0r{  ()w�    �       ͽ0!� i!�    �       
0�� ��[�   �  𞩋��0� ^2�    �       �"0k� �*�    �       N�0eO ���w	   �  �0��
�0P  �I"�    �       @(0^� p��n
   �  �0����0�� � ���   �  �$x�غ0�6 p�$�    �       	l0�\ ���a3   �  𞩋z�0�� ���$
   �  �
	��80N"  �N �    �       S0�   v:�    �       ,�0i�
 ���f�   �  �|G�f�0�Z  ����    �  ����M�0  rz�    	�       ��0 �H��ċ   �  hxɋS�0W  hO�     �   &m  ��09� ��    �  ������0T�  ��5��   �  �8�Z)0E� ��	�    �       "0�� ���    �       ��0=  �!�    �       	<
0�2 x��    �  hxɋ��0�� 8��8   �  `1��Z�03S �\��&
   �  ������0�p �6�    �       �0q� ��F�;8   �  �"��-�0ז  p��    �       ��0�* ���    �       .	0z
 8��   �  �0�?.07� ����u    �   � 1:0�� HI�    �       1�0l� `D�    �       �e0��  h��    �       /0�� ��    �       ��0"  � �    �       4=
0/S ȗ%�    �       �0�� �K�!�   �  `1��P�0�
 �:����   �  hxɋR�0H `-�    �       �(07z  hQ�    �  ������0�� P% �    �       h0�N ��y�E�   �  ���G�0v� X�G���   �  � G���0��  ��   �  ���GH0q  G-CRITICA

           MOVE "REFRESH-DATA" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.

       ATUALIZA-SEQUENCIA SECTION.
           CLOSE SEQBRAS
           OPEN I-O SEQBRAS
           MOVE 1 TO CONT-SEQUENCIA.
           READ SEQBRAS.
           MOVE SEQUENCIA-W       TO SEQUENCIA.
           REWRITE REG-SEQBRAS.
           CLOSE SEQBRAS
           OPEN INPUT SEQBRAS.
       ABRE-ARQUIVO-ANOTACAO SECTION.
           OPEN I-O CRD200 CRD201.
           IF ST-CRD200 = "35"  CLOSE CRD200  OPEN OUTPUT CRD200
                                CLOSE CRD200  OPEN I-O CRD200.
           IF ST-CRD201 = "35"  CLOSE CRD201  OPEN OUTPUT CRD201
                                CLOSE CRD201  OPEN I-O CRD201.
           IF ST-CRD200 <> "00"
              MOVE "ERRO ABERTURA CRD200: "  TO GS-MENSAGEM-ERRO
              MOVE ST-CRD200 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-CRD201 <> "00"
              MOVE "ERRO ABERTURA CRD201: "  TO GS-MENSAGEM-ERRO
              MOVE ST-CRD201 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
       GRAVA-ANOTACAO SECTION.
           MOVE COD-COMPL-CR20 TO COD-COMPL-CR200
           MOVE ZEROS TO SEQ-CR200 ULT-SEQ.
           START CRD200 KEY IS NOT < CHAVE-CR200 INVALID KEY
                 MOVE "10" TO ST-CRD200.
           PERFORM UNTIL ST-CRD200 = "10"
             READ CRD200 NEXT RECORD AT END MOVE "10" TO ST-CRD200
               NOT AT END
                 IF COD-COMPL-CR200 <> COD-COMPL-CR20
                              MOVE "10" TO ST-CRD200
                 ELSE MOVE SEQ-CR200 TO ULT-SEQ
                      CONTINUE
             END-READ
           END-PERFORM.
           MOVE ZEROS          TO SITUACAO-ANOTACAO-CR200
           ADD 1 TO ULT-SEQ.
           MOVE ULT-SEQ      TO SEQ-CR200.
           MOVE COD-COMPL-CR20 TO COD-COMPL-CR200.
           MOVE ZEROS        TO DATA-RETORNO-CR200
           MOVE USUARIO-W    TO USUARIO-CR200
           MOVE DATA-DIA-I   TO DATA-MOVTO-CR200
           MOVE HORA-BRA(1: 4) TO HORA-MOVTO-CR200

           MOVE ZEROS TO ST-CRD200.
           PERFORM UNTIL ST-CRD200 = "10"
              WRITE REG-CRD200 INVALID KEY
                 ADD 1 TO SEQ-CR200
                 CONTINUE
               NOT INVALID KEY MOVE "10" TO ST-CRD200
           END-PERFORM.

           MOVE SEQ-CR200      TO SEQ-CR201.
           MOVE COD-COMPL-CR20 TO COD-COMPL-CR201.
           MOVE "TRANSF.PORTADOR- DOCTO: XXXXXXXXXX - 99-XXXXXXXXXXXXXXX
      -    "X P/ 99-XXXXXXXXXXXXXXXX" TO ANOTACAO-CR201.
           MOVE NR-DOCTO-CR20       TO ANOTACAO-CR201(25: 11)
           MOVE PORTADOR-CR20       TO ANOTACAO-CR201(38: 4) PORTADOR
           READ CAD018 INVALID KEY MOVE SPACES TO NOME-PORT.
           MOVE NOME-PORT           TO ANOTACAO-CR201(43: 16)
           MOVE GS-ACP-PORTADOR     TO ANOTACAO-CR201(63: 4) PORTADOR
           READ CAD018 INVALID KEY MOVE SPACES TO NOME-PORT.
           MOVE NOME-PORT           TO ANOTACAO-CR201(67: 16)
           MOVE ZEROS TO ST-CRD201.
           MOVE 1              TO SUBSEQ-CR201.
           PERFORM UNTIL ST-CRD201 = "10"
             WRITE REG-CRD201 INVALID KEY
               ADD 1 TO SUBSEQ-CR201
               CONTINUE
              NOT INVALID KEY
                MOVE "10" TO ST-CRD201
             END-WRITE
           END-PERFORM.
       MOVER-DADOS-TIPO0 SECTION.
           MOVE 1 TO SEQ-W.
           MOVE "00"                     TO ID-REG-REM.
           MOVE "02"                     TO TIPO-INSC-T0
           MOVE 10874260000140           TO INSC-T0
           MOVE "EDA FORMATURAS LTDA ME" TO NOME-EMP-T0
           MOVE "CBR500"                 TO TIPO-ARQUIVO-T0
           MOVE ZEROS                    TO BRANCO1-T0
           MOVE REM-TIPO0 TO DADOS-REM.
           WRITE REG-REMESSA.
           MOVE REG-REMESSA TO REG-REMESSA2
           MOVE X"0D0A"    TO  PULA-REM2
           WRITE REG-REMESSA2
      *    AFTER 1
           MOVE ZEROS TO VALOR-TOTAL QTDE-TIT.

       MOVER-DADOS-TIPO1 SECTION.
           INITIALIZE REM-TIPO1
           MOVE "01"                     TO ID-REG-REM
           MOVE ZEROS                    TO CONVENIO-T1
           MOVE GS-CARTEIRA-BCO          TO CARTEIRA-T1
           MOVE 019                      TO VARIACAO-T1
           MOVE SPACES                   TO SEU-NUMERO-T1
           MOVE NR-DOCTO-CR20            TO SEU-NUMERO-T1
      *    STRING CLIENTE-CR20(1:4) NR-DOCTO-CR20 INTO SEU-NUMERO-T1

      * CALCULO PARA O NOSSO NUMERO -> BANCO DO BRASIL

           ADD 1 TO SEQUENCIA-W
           STRING "2085583" SEQUENCIA-W INTO NOSSO-NUMERO-T1

      *    STRING "178157" SEQUENCIA-W INTO TAB-SEQUENCIA
      *    MOVE 0                        TO IND TOTAL
      *    PERFORM UNTIL IND = 11
      *        ADD 1 TO IND
      *        EVALUATE IND
      *            WHEN 1   COMPUTE VALOR = TAB-SEQ(IND) * 7
      *            WHEN 2   COMPUTE VALOR = TAB-SEQ(IND) * 8
      *            WHEN 3   COMPUTE VALOR = TAB-SEQ(IND) * 9
      *            WHEN 4   COMPUTE VALOR = TAB-SEQ(IND) * 2
      *            WHEN 5   COMPUTE VALOR = TAB-SEQ(IND) * 3
      *            WHEN 6   COMPUTE VALOR = TAB-SEQ(IND) * 4
      *            WHEN 7   COMPUTE VALOR = TAB-SEQ(IND) * 5
      *            WHEN 8   COMPUTE VALOR = TAB-SEQ(IND) * 6
      *            WHEN 9   COMPUTE VALOR = TAB-SEQ(IND) * 7
      *            WHEN 10  COMPUTE VALOR = TAB-SEQ(IND) * 8
      *            WHEN 11  COMPUTE VALOR = TAB-SEQ(IND) * 9
      *        END-EVALUATE
      *        COMPUTE TOTAL = TOTAL + VALOR
      *    END-PERFORM
      *
      *    DIVIDE TOTAL BY 11 GIVING RESTO
      *
      *    COMPUTE RESTO = TOTAL - (RESTO * 11)
      *
      *    IF RESTO = 10
      *       MOVE "X"   TO DIGITO-VERIFICADOR
      *    ELSE
      *       IF RESTO = 0
      *          MOVE "0" TO DIGITO-VERIFICADOR
      *       ELSE
      *          MOVE RESTO(2:1) TO DIGITO-VERIFICADOR
      *       END-IF
      *    END-IF
      *
      *    STRING "1133379" SEQUENCIA-W DIGITO-VERIFICADOR "         "
      *      INTO NOSSO-NUMERO-T1

      *    MOVE ZEROS                    TO NOSSO-NUMERO-T1

           MOVE "X"                      TO CONTROLE-T1(1: 1)
           MOVE COD-COMPL-CR20           TO CONTROLE-T1(2: 9)
           MOVE SEQ-CR20                 TO CONTROLE-T1(11: 05)
           MOVE SPACES                   TO CONTROLE-T1(16: 10)
           MOVE "DM"                     TO SIGLA-ESPECIE-T1
           MOVE DATA-EMISSAO-CR20        TO DATA-EMISSAO-T1
           MOVE DATA-VENCTO-CR20         TO DATA-INV
           CALL "GRIDAT1" USING DATA-INV.
           MOVE DATA-INV                 TO DATA-VENCTO-T1
           MOVE VALOR-TOT-CR20           TO VALOR-W
           MOVE VALOR-W(1: 11)           TO VALOR-TITULO-T1(1: 11)
           MOVE VALOR-W(12: 2)           TO VALOR-TITULO-T1(12: 2)
           ADD VALOR-W                   TO VALOR-TOTAL
           ADD 1                         TO QTDE-TIT
           MOVE "09"                     TO CODIGO-MOEDA-T1
           MOVE ZEROS                    TO QUANTIDADE-MOEDA-T1
           MOVE "N"                      TO ACEITE-T1
           COMPUTE TAXA-JUROS = GS-TAXA-JURO / 100
           COMPUTE VALOR-ATRASO = (VALOR-TOT-CR20 * TAXA-JUROS) / 30
           MOVE VALOR-ATRASO(1: 11)      TO VALOR-JUROS-T1(1: 11)
           MOVE VALOR-ATRASO(12: 2)      TO VALOR-JUROS-T1(12: 2)
           MOVE ZEROS                    TO DATA-LIMITE-DESC-T1
           MOVE ZEROS                    TO VALOR-DESCONTO-T1
           MOVE ZEROS                    TO VALOR-ABATIMENTO-T1
           MOVE GS-PROTESTO              TO QUANTIDADE-DIA-PRO-T1
           IF GS-PROTESTO > 0
      *       MOVE GS-PROTESTO           TO MASC-DIA
              INITIALIZE MENSAGEM-T1
      *       STRING "PROTESTAR APOS " MASC-DIA " DIAS" INTO
      *               MENSAGEM-T1
           ELSE
              MOVE "NAO RECEBER APOS 30 DIAS DE VENCIDO" TO MENSAGEM-T1
           END-IF
           MOVE 002085583                TO CONVENIO7-POS-T1

           MOVE ZEROS                    TO CODIGO-MULTA-T1
           MOVE ZEROS                    TO DATA-MULTA-T1
           MOVE ZEROS                    TO VALOR-MULTA-T1

           MOVE SPACES                   TO FILLER-T1
           MOVE COD-COMPL-CR20           TO COD-COMPL-CG14
           READ CGD014 INVALID KEY
               MOVE SPACES                   TO TIPO-INSCRICAO-AVAL-T1
               MOVE SPACES                   TO INSCRICAO-AVALISTA-T1
               MOVE SPACES                   TO NOME-AVALISTA-T1
           NOT INVALID KEY
               IF CPF-CG14 > 100000000000
                  MOVE "02"               TO TIPO-INSCRICAO-AVAL-T1
                  MOVE CPF-CG14(1: 14)    TO INSCRICAO-AVALISTA-T1
               ELSE
                  MOVE "01"               TO TIPO-INSCRICAO-AVAL-T1
                  MOVE CPF-CG14(4: 11)    TO INSCRICAO-AVALISTA-T1
                  MOVE SPACES             TO INSCRICAO-AVALISTA-T1(12:3)
               END-IF
               MOVE NOME-CG14             TO NOME-AVALISTA-T1
           END-READ


           MOVE "S"                      TO PENDENTE-IMPRESSAO-T1
           MOVE COD-COMPL-CR20           TO COD-COMPL-CG10
                                            COD-COMPL-CG11
           READ CGD010 INVALID KEY
                INITIALIZE REG-CGD010.

           READ CGD011 INVALID KEY
                INITIALIZE REG-CGD011.

           MOVE COMPRADOR-CG10           TO NOME-CLIENTE-T1
           MOVE ENDERECO1-CG11           TO ENDERECO-CLIENTE-T1

           IF CPF1-CG11 > 100000000000
              MOVE "02"                  TO TIPO-INSCRICAO-CLI-T1
              MOVE CPF1-CG11(3: 16)      TO INSCRICAO-CLIENTE-T1
           ELSE
              MOVE "01"                  TO TIPO-INSCRICAO-CLI-T1
              MOVE CPF1-CG11(6: 16)      TO INSCRICAO-CLIENTE-T1
              MOVE SPACES                TO INSCRICAO-CLIENTE-T1(12:3)
           END-IF

           MOVE CEP1-CG11                TO CEP-CLIENTE-T1
           MOVE CIDADE1-CG11             TO CIDADE
           READ CAD010 INVALID KEY
                MOVE SPACES TO NOME-CID UF-CID.

           MOVE NOME-CID                 TO CIDADE-CLIENTE-T1
           MOVE UF-CID                   TO UF-CLIENTE-T1
           CALL "UTI0080" USING UF-CLIENTE-T1 ESTADO-DESCRICAO-T1(1:20)
           CANCEL "UTI0080"
           MOVE ZEROS                    TO DATA-PAGAMENTO-T1
           MOVE ZEROS                    TO VALOR-PAGO-T1
           MOVE GS-MODALIDADE(1:2)       TO TIPO-MODALIDADE-T1
           MOVE "09"                     TO ESTADO-DO-TITULO-T1
           MOVE ALL ZEROS                TO USO-DO-BANCO-T1

           ADD 1  TO SEQ-W.
           MOVE REM-TIPO1 TO DADOS-REM.
           WRITE REG-REMESSA
           MOVE REG-REMESSA TO REG-REMESSA2
           MOVE X"0D0A"    TO  PULA-REM2
           WRITE REG-REMESSA2.
      *    AFTER 1.
       MOVER-DADOS-TIPO4 SECTION.
           MOVE "99"                     TO ID-REG-REM.
           MOVE SEQ-W                    TO QUANTIDADE-T2
           MOVE ZEROS                    TO BRANCO-T2
           MOVE REM-TIPO2                TO DADOS-REM.
           WRITE REG-REMESSA
           MOVE REG-REMESSA TO REG-REMESSA2
           MOVE X"0D0A"    TO  PULA-REM2
           WRITE REG-REMESSA2.
      *    AFTER 1.
       CARREGA-LISTA SECTION.
           MOVE "CLEAR-LIST-BOX" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM
           OPEN INPUT REMESSA.
           MOVE SPACES TO GS-LINDET.
           MOVE ZEROS TO ST-REM.
           PERFORM UNTIL ST-REM = "10"
            READ REMESSA AT END MOVE "10" TO ST-REM
             NOT AT END
              MOVE REG-REMESSA(1: 2) TO TIPO-W
              EVALUATE TIPO-W
                WHEN 0  PERFORM CABECALHO-TIPO0
                        PERFORM LINDET-TIPO0
                        PERFORM CABECALHO-TIPO1
                WHEN 1  PERFORM LINDET-TIPO1
                WHEN 99 PERFORM CABECALHO-TIPO9
                               PERFORM LINDET-TIPO9
              END-EVALUATE
            END-READ
           END-PERFORM.
           MOVE VALOR-TOTAL        TO GS-VALOR-TOTAL
           MOVE QTDE-TIT           TO GS-QTDE-TITULO
           MOVE "REFRESH-DATA" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
           CLOSE REMESSA.
       CABECALHO SECTION.
           MOVE DATA-DIA TO EMISSAO-REL.
           IF LIN = ZEROS
              WRITE REG-RELAT FROM CAB01
           ELSE WRITE REG-RELAT FROM CAB01 AFTER PAGE.
           WRITE REG-RELAT FROM CAB02.
           WRITE REG-RELAT FROM CAB03.
           WRITE REG-RELAT FROM CAB02.
           MOVE 4 TO LIN.
       IMPRIME-RELATORIO SECTION.
           ACCEPT VARIA-W FROM TIME.
           OPEN OUTPUT WORK.
           OPEN INPUT REMESSA.
           MOVE ZEROS TO SEQ-WK.
           MOVE ZEROS TO ST-REM.
           PERFORM UNTIL ST-REM = "10"
             READ REMESSA AT END MOVE "10" TO ST-REM
               NOT AT END
                MOVE REG-REMESSA(1: 2) TO TIPO-W
                IF TIPO-W <> 1 CONTINUE
                ELSE
                 MOVE REG-REMESSA(3: 498) TO REM-TIPO1
                 ADD 1 TO SEQ-WK
                 MOVE NOME-CLIENTE-T1        TO NOME-WK
                 MOVE ENDERECO-CLIENTE-T1    TO ENDERECO-WK
                 MOVE CIDADE-CLIENTE-T1      TO CIDADE-WK
                 MOVE UF-CLIENTE-T1          TO UF-WK
                 MOVE CEP-CLIENTE-T1         TO CEP-WK
                 MOVE SEU-NUMERO-T1          TO DOCTO-WK
                 MOVE VALOR-TITULO-T1(4: 8)  TO VALOR-WK(1: 8)
                 MOVE VALOR-TITULO-T1(12: 2) TO VALOR-WK(9: 2)
                 WRITE REG-WORK
                 END-WRITE
                END-IF
             END-READ
           END-PERFORM.

           COPY "COND-IMP".
           OPEN OUTPUT RELAT.
           CLOSE WORK.  OPEN INPUT WORK.
           MOVE ZEROS TO LIN.
           PERFORM CABECALHO.
           MOVE SPACES TO NOME-WK.
           START WORK KEY IS NOT < NOME-WK INVALID KEY
                 MOVE "10" TO ST-WORK.
           PERFORM UNTIL ST-WORK = "10"
             READ WORK NEXT RECORD END MOVE "10" TO ST-WORK
               NOT AT END
                 MOVE NOME-WK           TO NOME-REL
                 MOVE ENDERECO-WK       TO ENDERECO-REL
                 MOVE CIDADE-WK         TO CIDADE-REL
                 MOVE UF-WK             TO UF-REL
                 MOVE CEP-WK            TO CEP-REL
                 MOVE DOCTO-WK          TO DOCTO-REL
                 MOVE VALOR-WK          TO VALOR-REL
                 WRITE REG-RELAT FROM LINDET
                 ADD 1 TO LIN
                 IF LIN > 56 PERFORM CABECALHO
                 END-IF
             END-READ
           END-PERFORM.
           MOVE VALOR-TOTAL             TO VALOR-TOTAL-REL.
           MOVE QTDE-TIT                TO QTDE-TIT-TOTAL-REL.
           WRITE REG-RELAT FROM LINDET1 AFTER 3.
           MOVE SPACES TO REG-RELAT.
           WRITE REG-RELAT AFTER PAGE.
           CLOSE RELAT REMESSA WORK.
           DELETE FILE WORK.
           COPY "DESC-IMP".
      *---------------------------------------------------
       LER-PORTADOR SECTION.
           MOVE GS-PORTADOR TO PORTADOR.
           READ CAD018 INVALID KEY MOVE "*******"  TO NOME-PORT.
           MOVE NOME-PORT TO GS-DESCR-PORTADOR.
       POPUP-PORTADOR SECTION.
           CALL "CAP018T" USING PARAMETROS-W STRING-1
           CANCEL "CAP018T"
           MOVE STRING-1(1: 30) TO GS-DESCR-PORTADOR
           MOVE STRING-1(33: 4) TO GS-PORTADOR.
      *----------------------------------------------------------
       CABECALHO-TIPO0 SECTION.
           MOVE SPACES TO GS-LINDET.
           MOVE "I"                 TO GS-LINDET(1: 2)
           MOVE "LIT.REM"           TO GS-LINDET(3: 8)
           MOVE "CS"                TO GS-LINDET(11: 3)
           MOVE "LIT-SERVICO"       TO GS-LINDET(14: 16)
           MOVE "BRANCO"            TO GS-LINDET(30: 08)
           MOVE "AGENC"             TO GS-LINDET(38: 05)
           MOVE "V"                 TO GS-LINDET(43: 2)
           MOVE "CONTA"             TO GS-LINDET(45: 09)
           MOVE "D"                 TO GS-LINDET(54: 02)
           MOVE "NR.CON"            TO GS-LINDET(56: 07)
           MOVE "NOME-EMPRESA"      TO GS-LINDET(63: 31)
           MOVE "NOME-BANCO"        TO GS-LINDET(94: 19)
           MOVE "DDMMAA"            TO GS-LINDET(113: 7)
           MOVE "SEQUEN"            TO GS-LINDET(120: 8)
           MOVE "BRANCO"            TO GS-LINDET(128: 288)
           MOVE "SEQUEN"            TO GS-LINDET(416: 06)
           MOVE "INSERE-LIST" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
       LINDET-TIPO0 SECTION.
           MOVE SPACES TO GS-LINDET.
           MOVE REG-REMESSA(3: 498) TO REM-TIPO0.
      *    MOVE IDENT-ARQ-T0        TO GS-LINDET(1: 2)
      *    MOVE LITERAL-REMESSA-T0  TO GS-LINDET(3: 8)
      *    MOVE CODIGO-SERVICO-T0   TO GS-LINDET(11: 3)
      *    MOVE LITERAL-SERVICO-T0  TO GS-LINDET(14: 16)
      *    MOVE BRANCO-T0           TO GS-LINDET(30: 08)
      *    MOVE AGENCIA-T0          TO GS-LINDET(38: 05)
      *    MOVE VER-AGENCIA-T0      TO GS-LINDET(43: 2)
      *    MOVE CONTA-T0            TO GS-LINDET(45: 09)
      *    MOVE VERIF-EMP-T0        TO GS-LINDET(54: 02)
      *    MOVE NR-CONVENENTE-T0    TO GS-LINDET(56: 07)
      *    MOVE NOME-EMP-T0         TO GS-LINDET(63: 31)
      *    MOVE NOME-BANCO-T0       TO GS-LINDET(94: 19)
      *    MOVE DDMMAA-T0           TO GS-LINDET(113: 7)
      *    MOVE SEQUENCIAL-T0       TO GS-LINDET(120: 8)
      *    MOVE BRANCO1-T0          TO GS-LINDET(128: 288)
      *    MOVE REG-REMESSA(395: 6) TO GS-LINDET(416: 6)
           MOVE "INSERE-LIST" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.

       CABECALHO-TIPO1 SECTION.
           MOVE SPACES TO GS-LINDET.
           MOVE "INSERE-LIST" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE "CONVEN"            TO GS-LINDET(1:7)
           MOVE "CT"                TO GS-LINDET(8:3)
           MOVE "VAR"               TO GS-LINDET(11:4)
           MOVE "SEU-NR"            TO GS-LINDET(15:11)
           MOVE "NOSSO-NR"          TO GS-LINDET(26:20)
           MOVE "CONTROLE"          TO GS-LINDET(46:25)
           MOVE "SIGLA"             TO GS-LINDET(71:6)
           MOVE "DT-EMISS"          TO GS-LINDET(77:9)
           MOVE "DT-VECTO"          TO GS-LINDET(86:9)
           MOVE "   VLR-TITULO"     TO GS-LINDET(108:14)
           MOVE "C-MOE"             TO GS-LINDET(122:6)
           MOVE "    QTD-MOEDA"     TO GS-LINDET(128:14)
           MOVE "A"                 TO GS-LINDEt(142:2)
           MOVE "      VLR-JRS"     TO GS-LINDET(144:14)
           MOVE "DT-LIMIT"          TO GS-LINDET(158:9)
           MOVE "     VLR-DESC"     TO GS-LINDET(167:14)
           MOVE "     VLR-ABAT"     TO GS-LINDET(183:14)
           MOVE "DP"                TO GS-LINDET(197:3)
           MOVE "MENSAGEM"          TO GS-LINDET(200:41)
           MOVE "CONV7POS"          TO GS-LINDET(241:10)
           MOVE "M"                 TO GS-LINDET(251:2)
           MOVE "DT-MULTA"          TO GS-LINDET(253:9)
           MOVE "    VLR-MULTA"     TO GS-LINDET(262:14)
           MOVE "FILLER"            TO GS-LINDET(278:10)
           MOVE "TA"                TO GS-LINDET(288:3)
           MOVE "INSC.AVAL"         TO GS-LINDET(291:15)
           MOVE "NOME AVALISTA"     TO GS-LINDET(306:38)
           MOVE "I"                 TO GS-LINDET(344:2)
           MOVE "TC"                TO GS-LINDET(346:3)
           MOVE "INSC.CLIENTE"      TO GS-LINDET(349:15)
           MOVE "NOME CLIENTE"      TO GS-LINDET(364:38)
           MOVE "ENDERECO"          TO GS-LINDET(402:38)
           MOVE "CEP"               TO GS-LINDET(440:9)
           MOVE "CIDADE"            TO GS-LINDET(449:16)
           MOVE "UF"                TO GS-LINDET(465:3)

           MOVE "INSERE-LIST" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.

       LINDET-TIPO1 SECTION.
           MOVE SPACES TO GS-LINDET.
           MOVE REG-REMESSA(3: 498)    TO REM-TIPO1.
           MOVE CONVENIO-T1            TO GS-LINDET(1:7)
           MOVE CARTEIRA-T1            TO GS-LINDET(8:3)
           MOVE VARIACAO-T1            TO GS-LINDET(11:4)
           MOVE SEU-NUMERO-T1          TO GS-LINDET(15:11)
           MOVE NOSSO-NUMERO-T1        TO GS-LINDET(26:20)
           MOVE CONTROLE-T1            TO GS-LINDET(46:25)
           MOVE SIGLA-ESPECIE-T1       TO GS-LINDET(71:6)
           MOVE DATA-EMISSAO-T1        TO GS-LINDET(77:9)
           MOVE DATA-VENCTO-T1         TO GS-LINDET(86:9)
           MOVE VALOR-TITULO-T1        TO GS-LINDET(108:14)
           MOVE CODIGO-MOEDA-T1        TO GS-LINDET(122:6)
           MOVE QUANTIDADE-MOEDA-T1    TO GS-LINDET(128:14)
           MOVE ACEITE-T1              TO GS-LINDEt(142:2)
           MOVE VALOR-JUROS-T1         TO GS-LINDET(144:14)
           MOVE DATA-LIMITE-DESC-T1    TO GS-LINDET(158:9)
           MOVE VALOR-DESCONTO-T1      TO GS-LINDET(167:14)
           MOVE VALOR-ABATIMENTO-T1    TO GS-LINDET(183:14)
           MOVE QUANTIDADE-DIA-PRO-T1  TO GS-LINDET(197:3)
           MOVE MENSAGEM-T1            TO GS-LINDET(200:41)
           MOVE CONVENIO7-POS-T1       TO GS-LINDET(241:10)
           MOVE CODIGO-MULTA-T1        TO GS-LINDET(251:2)
           MOVE DATA-MULTA-T1          TO GS-LINDET(253:9)
           MOVE VALOR-MULTA-T1         TO GS-LINDET(262:14)
           MOVE FILLER-T1              TO GS-LINDET(278:10)
           MOVE TIPO-INSCRICAO-AVAL-T1 TO GS-LINDET(288:3)
           MOVE INSCRICAO-AVALISTA-T1  TO GS-LINDET(291:15)
           MOVE NOME-AVALISTA-T1       TO GS-LINDET(306:38)
           MOVE PENDENTE-IMPRESSAO-T1  TO GS-LINDET(344:2)
           MOVE TIPO-INSCRICAO-CLI-T1  TO GS-LINDET(346:3)
           MOVE INSCRICAO-CLIENTE-T1   TO GS-LINDET(349:15)
           MOVE NOME-CLIENTE-T1        TO GS-LINDET(364:38)
           MOVE ENDERECO-CLIENTE-T1    TO GS-LINDET(402:38)
           MOVE CEP-CLIENTE-T1         TO GS-LINDET(440:9)
           MOVE CIDADE-CLIENTE-T1      TO GS-LINDET(449:16)
           MOVE UF-CLIENTE-T1          TO GS-LINDET(465:3)

           MOVE "INSERE-LIST" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
       CABECALHO-TIPO9 SECTION.
           MOVE SPACES TO GS-LINDET.
           MOVE "INSERE-LIST" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE "BRANCOS"     TO GS-LINDET(01: 394)
           MOVE "SEQUEN"      TO GS-LINDET(395: 6)
           MOVE "INSERE-LIST" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
       LINDET-TIPO9 SECTION.
           MOVE SPACES              TO GS-LINDET.
           MOVE SPACES              TO GS-LINDET(1: 394)
           MOVE SEQ-W               TO GS-LINDET(395: 6).
           MOVE "INSERE-LIST" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
      *---------------------------------------------------
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET.
           MOVE "EXIBE-ERRO" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1 TO GS-EXIT-FLG.
           MOVE 1 TO ERRO-W.
       CLEAR-FLAGS SECTION.
           INITIALIZE GS-FLAG-GROUP.

       SET-UP-FOR-REFRESH-SCREEN SECTION.
           MOVE "REFRESH-DATA" TO DS-PROCEDURE.

       LOAD-SCREENSET SECTION.
           MOVE DS-PUSH-SET TO DS-CONTROL
           MOVE "CRP9108" TO DS-SET-NAME
           PERFORM CALL-DIALOG-SYSTEM.

       exibir-mensagem section.
           move    spaces to resp-msg.
           call    "MENSAGEM" using tipo-msg resp-msg mensagem
           cancel  "MENSAGEM".
           move 1 to gs-flag-critica
           move spaces to mensagem.

       CALL-DIALOG-SYSTEM SECTION.
           CALL "DSRUN" USING DS-CONTROL-BLOCK, GS-DATA-BLOCK.
           IF NOT DS-NO-ERROR
              MOVE DS-ERROR-CODE TO DISPLAY-ERROR-NO
              DISPLAY "DS ERROR NO:  " DISPLAY-ERROR-NO
             GO FINALIZAR-PROGRAMA
           END-IF.
       FINALIZAR-PROGRAMA SECTION.
           open i-o logacess

           move function current-date to ws-data-sys

           move usuario-w           to logacess-usuario
           move ws-data-cpu         to logacess-data
           accept ws-hora-sys from time
           move ws-hora-sys         to logacess-horas
           move 1                   to logacess-sequencia
           move "CRP9108"           to logacess-programa
           move "FECHADO"           to logacess-status
           move "10" to fs-logacess
           perform until fs-logacess = "00"
                write reg-logacess invalid key
                    add 1 to logacess-sequencia
                not invalid key
                    move "00" to fs-logacess
                end-write
           end-perform

           close logacess

           CLOSE CRD020 SEQBRAS CGD010 CGD011 CGD014 CAD010 CAD018
                 CAD002 RETPORT.
           MOVE DS-QUIT-SET TO DS-CONTROL.
           PERFORM CALL-DIALOG-SYSTEM.
           EXIT PROGRAM.
