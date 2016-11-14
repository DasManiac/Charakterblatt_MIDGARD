unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CheckLst;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    CheckListBox1: TCheckListBox;
    Label2: TLabel;
    CheckListBox2: TCheckListBox;
    Label3: TLabel;
    CheckListBox3: TCheckListBox;
    Label4: TLabel;
    CheckListBox4: TCheckListBox;
    Label5: TLabel;
    CheckListBox5: TCheckListBox;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Shape1: TShape;
    procedure faehigkeit(st:ShortString; leit,wert,c,d,e,f,punkt:Byte; liste:TCheckListBox);
    procedure waffenfaehigkeit(st:ShortString; k,wert,c,d,e,f,punkt:Byte; liste:TCheckListBox);
    procedure FormShow(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckListBox2ClickCheck(Sender: TObject);
    procedure CheckListBox3ClickCheck(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckListBox4ClickCheck(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form3: TForm3;
  MPFk,MPWk,MPAk,MPUk,MPZk:ShortInt;


implementation

uses Unit1, Unit2;

{$R *.dfm}

procedure TForm3.faehigkeit(st:ShortString; leit,wert,c,d,e,f,punkt:Byte; liste:TCheckListBox);
 var bonus:String[3];
     i,j,l:Byte;
begin
 Case leit Of
  0: i:=0;
  1: i:=a[1];
  2: i:=a[2];
  3: i:=a[3];
  4: i:=a[4];
  5: i:=a[5];
  6: i:=a[6];
  7: i:=pA;
  8: i:=Au;
  10:i:=Wk;
 End;
 If i < 81 Then
  bonus:=''
 Else If i < 96 Then
  bonus:=' +1'
 Else
  bonus:=' +2';

 Case c Of
  0: j:=0;
  1: j:=a[1];
  2: j:=a[2];
  3: j:=a[3];
  4: j:=a[4];
  5: j:=a[5];
  6: j:=a[6];
  7: j:=pA;
  8: j:=Au;
  9: j:=100 - pA;
  10:j:=Wk;
 End;
 Case e Of
  0: l:=0;
  1: l:=a[1];
  2: l:=a[2];
  3: l:=a[3];
  4: l:=a[4];
  5: l:=a[5];
  6: l:=a[6];
  7: l:=pA;
  8: l:=Au;
  9: l:=100 - pA;
  10:l:=Wk;
 End;

 Liste.Items.Add('(' + IntToStr(punkt) + 'P) - ' + st + bonus + ' +' +  IntToStr(wert));
 If ((j < d) OR (l < f)) Then
  liste.ItemEnabled[liste.Count-1]:=False;
end;

procedure TForm3.waffenfaehigkeit(st:ShortString; k,wert,c,d,e,f,punkt:Byte; liste:TCheckListBox);
 var j,l:Byte;
     z:String[2];
begin
 Case c Of
  0: j:=0;
  1: j:=a[1];
  2: j:=a[2];
  3: j:=a[3];
 End;
 Case e Of
  0: l:=0;
  1: l:=a[1];
  2: l:=a[2];
  3: l:=a[3];
 End;

 If k < 10 Then
  z:='0' + IntToStr(k)
 Else
  z:=IntToStr(k);

 Liste.Items.Add('(' + IntToStr(punkt) + 'P) - [' + z + '] ' + st + ' +' +  IntToStr(wert));
 If ((j < d) OR (l < f)) Then
  liste.ItemEnabled[liste.Count-1]:=False;
end;

procedure TForm3.FormShow(Sender: TObject);
 var i:Byte;
     hoehe:Integer;
begin
 Form1.Enabled:=False;
 MPFk:=PFk;
 MPWk:=PWk;
 MPAk:=PAk;
 MPUk:=PUk;
 MPZk:=PZk;

 Label2.Caption:='Fachkenntnisse (' + IntToStr(MPFk) + '/' + IntToStr(PFk) + ')';
 Label3.Caption:='Waffenkenntnisse (' + IntToStr(MPWk) + '/' + IntToStr(PWk) + ')';
 Label4.Caption:='Allgemeine Kenntnisse (' + IntToStr(MPAk) + '/' + IntToStr(PAk) + ')';
 Label5.Caption:='Ungew�hnliche Kenntnisse (' + IntToStr(MPUk) + '/' + IntToStr(PUk) + ')';
 Label6.Caption:='Zauberkenntnisse (' + IntToStr(MPZk) + '/' + IntToStr(PZk) + ')';
 // faehigkeit('',,,,,,,i,CheckListBox1);
 // waffenfaehigkeit('',,,,,,i,CheckListBox2);


 If klasse = 7 Then
  Begin
   Label1.Caption:='Krieger(Kr)';

       i:=0;
   faehigkeit('Kampf in Schlachtreihe',0,5,0,0,0,0,i,CheckListBox1);
       i:=1;
   faehigkeit('Kampf in Vollr�stung',1,15,1,61,0,0,i,CheckListBox1);
   faehigkeit('Reiten',3,15,3,21,0,0,i,CheckListBox1);
   faehigkeit('Streitwagen lenken',2,15,2,21,0,0,i,CheckListBox1);
   faehigkeit('Wagenlenken',2,15,2,21,0,0,i,CheckListBox1);
       i:=2;
   faehigkeit('Beidh�ndiger Kampf',3,3,3,61,0,0,i,CheckListBox1);
   faehigkeit('Bogenkampf zu Pferd',2,15,2,31,0,0,i,CheckListBox1);
   faehigkeit('Kampf zu Pferd',3,15,3,21,0,0,i,CheckListBox1);
   faehigkeit('Kampf vom Streitwagen',3,15,3,21,0,0,i,CheckListBox1);
   faehigkeit('Kampftaktik',7,8,7,61,5,31,i,CheckListBox1);
   faehigkeit('Schie�en vom Streitwagen',2,15,2,31,0,0,i,CheckListBox1);
   faehigkeit('Schiffsf�hrung',5,8,5,31,7,61,i,CheckListBox1);
       i:=3;
   faehigkeit('Athletik',1,4,1,31,4,31,i,CheckListBox1);

       i:=1;
   waffenfaehigkeit('Dolch',01,5,2,01,0,00,i,CheckListBox2);
   waffenfaehigkeit('Langschwert',02,5,1,31,2,21,i,CheckListBox2);
   waffenfaehigkeit('Krumms�bel',02,5,1,31,2,11,i,CheckListBox2);
   waffenfaehigkeit('Kurzschwert',01,5,2,01,0,00,i,CheckListBox2);
   waffenfaehigkeit('Ochsenzunge',01,5,2,31,0,00,i,CheckListBox2);
   waffenfaehigkeit('Rapier',01,5,2,51,1,11,i,CheckListBox2);
   waffenfaehigkeit('Keule',03,5,1,01,0,00,i,CheckListBox2);
   waffenfaehigkeit('Streitkolben',03,5,1,31,0,00,i,CheckListBox2);
   waffenfaehigkeit('Kriegshammer',03,5,1,61,2,11,i,CheckListBox2);
   waffenfaehigkeit('Handaxt',03,5,1,11,0,00,i,CheckListBox2);
   waffenfaehigkeit('Streitaxt',03,5,1,61,2,11,i,CheckListBox2);
   waffenfaehigkeit('Leichter Speer',04,5,2,01,0,00,i,CheckListBox2);
   waffenfaehigkeit('Sto�speer',04,5,1,31,2,11,i,CheckListBox2);
   waffenfaehigkeit('Lanze',04,5,1,61,2,11,i,CheckListBox2);
   waffenfaehigkeit('Stabkeule',06,5,1,81,0,00,i,CheckListBox2);
   waffenfaehigkeit('Morgenstern',08,5,1,61,2,61,i,CheckListBox2);
   waffenfaehigkeit('Wurfspeer',14,5,1,31,2,21,i,CheckListBox2);
   waffenfaehigkeit('Wurfspie�',14,5,1,61,2,21,i,CheckListBox2);
   waffenfaehigkeit('Wurfaxt',16,5,1,31,2,31,i,CheckListBox2);
   waffenfaehigkeit('Wurfhammer',16,5,1,61,2,31,i,CheckListBox2);
   waffenfaehigkeit('Wurfkeule',16,5,1,31,2,31,i,CheckListBox2);
   waffenfaehigkeit('Wurfmesser',15,5,2,61,0,00,i,CheckListBox2);
   waffenfaehigkeit('Wurfpfeil',17,5,2,31,1,11,i,CheckListBox2);
   waffenfaehigkeit('Gro�er Schild',25,1,1,61,0,00,i,CheckListBox2);
   waffenfaehigkeit('Kleiner Schild',25,1,1,31,2,11,i,CheckListBox2);
   waffenfaehigkeit('Buckler',25,1,2,61,0,00,i,CheckListBox2);
   waffenfaehigkeit('Parierdolch',26,1,2,61,0,00,i,CheckListBox2);
       i:=2;
   waffenfaehigkeit('Fuchtel',01,5,2,31,1,61,i,CheckListBox2);
   waffenfaehigkeit('Bih�nder',05,5,1,61,2,31,i,CheckListBox2);
   waffenfaehigkeit('Anderthalbh�nder',05,5,1,31,2,21,i,CheckListBox2);
   waffenfaehigkeit('Schlachtbeil',06,5,1,61,2,31,i,CheckListBox2);
   waffenfaehigkeit('Hellebarde',07,5,1,61,2,61,i,CheckListBox2);
   waffenfaehigkeit('Stielhammer',07,5,1,81,2,31,i,CheckListBox2);
   waffenfaehigkeit('Kriegsflegel',08,5,1,61,2,31,i,CheckListBox2);
   waffenfaehigkeit('Kampfstab',11,5,2,61,1,31,i,CheckListBox2);
   waffenfaehigkeit('Fauskampf',09,5,1,31,3,21,i,CheckListBox2);
   waffenfaehigkeit('Waffenloser Kampf',09,5,1,21,3,21,i,CheckListBox2);
   waffenfaehigkeit('Bogen',22,5,2,31,1,31,i,CheckListBox2);
   waffenfaehigkeit('Kurzbogen',22,5,2,31,1,11,i,CheckListBox2);
   waffenfaehigkeit('Langbogen',22,5,2,61,1,61,i,CheckListBox2);
   waffenfaehigkeit('Leichte Armbrust',21,5,2,31,0,00,i,CheckListBox2);
   waffenfaehigkeit('Schwere Armbrist',21,5,2,31,1,61,i,CheckListBox2);
   waffenfaehigkeit('Schleuder',23,5,2,61,0,00,i,CheckListBox2);
   waffenfaehigkeit('Stockschleuder',23,5,2,81,1,31,i,CheckListBox2);
  End;

 //------------------------------Allgemeine_Kenntnisse----------

     i:=0;
 faehigkeit('Spechen: Muttersprache',5,10,5,1,0,0,i,CheckListBox3);
 faehigkeit('Spechen: Muttersprache',5,14,5,31,0,0,i,CheckListBox3);
 faehigkeit('Spechen: Muttersprache',5,18,5,61,0,0,i,CheckListBox3);
 faehigkeit('Spechen: Sprache',5,9,5,1,0,0,i,CheckListBox3);
 faehigkeit('Spechen: Sprache',5,12,5,31,0,0,i,CheckListBox3);
     i:=1;
 If heimat = 0 Then
  faehigkeit('Himmelskunde',5,4,5,21,0,0,i,CheckListBox3)
 Else
  faehigkeit('Erz�hlen',5,8,5,31,7,31,i,CheckListBox3);
 faehigkeit('Schreiben: Muttersprache',5,4,5,21,0,0,i,CheckListBox3);
 faehigkeit('Singen',7,8,7,31,0,0,i,CheckListBox3);
 faehigkeit('Schreiben: Sprache',5,4,5,1,0,0,i,CheckListBox3);
 faehigkeit('Tanzen',3,10,3,31,0,0,i,CheckListBox3);
     i:=2;
 If heimat = 0 Then
  faehigkeit('Fallenstellen',2,4,2,31,0,0,i,CheckListBox3)
 Else
  Begin
  faehigkeit('Gaukeln',2,8,2,61,0,0,i,CheckListBox3);
  faehigkeit('Geheimzeichen',5,6,5,21,0,0,i,CheckListBox3);
  End;
 faehigkeit('Landeskunde: Heimat',5,9,5,21,0,0,i,CheckListBox3);
 faehigkeit('Musizieren',2,8,2,31,0,0,i,CheckListBox3);
 faehigkeit('Reiten',3,10,3,21,0,0,i,CheckListBox3);
 If heimat = 0 then
  Begin
  faehigkeit('Rudern',1,10,1,21,2,21,i,CheckListBox3);
  faehigkeit('Schlittenfahren',2,10,2,21,0,0,i,CheckListBox3);
  End;
 faehigkeit('Schreiben: Muttersprache',5,9,5,21,0,0,i,CheckListBox3);
 faehigkeit('Seilkunst',2,6,2,61,0,0,i,CheckListBox3);
 if heimat = 0 Then
  faehigkeit('Skifahren',3,10,3,21,0,0,i,CheckListBox3);
 faehigkeit('Sprechen: Sprache',5,9,5,1,0,0,i,CheckListBox3);
 faehigkeit('Wagenlenken',2,10,2,21,0,0,i,CheckListBox3);
 waffenfaehigkeit('Dolch',01,4,2,01,0,00,i,CheckListBox3);
 If heimat = 0 then
  waffenfaehigkeit('Leichter Speer',04,4,2,01,0,00,i,CheckListBox3)
 Else
  waffenfaehigkeit('Keule',03,4,1,01,0,00,i,CheckListBox3);
     i:=3;
 faehigkeit('Erste Hilfe',2,6,2,31,5,31,i,CheckListBox3);
 If heimat = 0 Then
  Begin
  faehigkeit('Gel�ndelauf',3,10,3,31,0,0,i,CheckListBox3);
  faehigkeit('Klettern',1,10,1,31,3,61,i,CheckListBox3);
  faehigkeit('Naturkunde',5,4,5,61,0,0,i,CheckListBox3);
  faehigkeit('Pflanzenkunde',5,4,5,61,0,0,i,CheckListBox3);
  End
 Else
  Begin
  faehigkeit('Gassenwissen',5,4,5,61,7,31,i,CheckListBox3);
  faehigkeit('Gl�cksspiel',2,12,2,61,0,0,i,CheckListBox3);
  faehigkeit('Menschenkenntnis',5,4,5,31,0,0,i,CheckListBox3);
  faehigkeit('Rechnen',5,4,5,81,0,0,i,CheckListBox3);
  End;
 faehigkeit('Sagenkunde: Heimat',5,4,5,61,0,0,i,CheckListBox3);
 If heimat = 1 Then
  Begin
  faehigkeit('Sch�tzen',5,4,5,61,0,0,i,CheckListBox3);
  faehigkeit('Schauspielern',7,6,7,61,0,0,i,CheckListBox3);
  End;
 faehigkeit('Schreiben: Muttersprache',5,12,5,61,0,0,i,CheckListBox3);
 If heimat = 0 Then
  faehigkeit('Schwimmen',3,10,3,11,0,0,i,CheckListBox3);
 faehigkeit('Sprechen: Sprache',5,12,5,31,0,0,i,CheckListBox3);
 If heimat = 0 Then
  Begin
   faehigkeit('Spurenlesen',5,4,5,31,0,0,i,CheckListBox3);
   faehigkeit('Tierkunde',5,4,5,61,0,0,i,CheckListBox3);
   faehigkeit('�berleben',5,6,5,21,0,0,i,CheckListBox3);
  End;
     i:=4;
 If heimat = 0 Then
  Begin
  faehigkeit('Abrichten',7,5,7,61,0,0,i,CheckListBox3);
  faehigkeit('Steuern',2,10,2,31,1,21,i,CheckListBox3);
  End
 Else
  Begin
  faehigkeit('Beredsamkeit',7,6,7,61,5,61,i,CheckListBox3);
  faehigkeit('Stehlen',2,8,2,61,0,0,i,CheckListBox3);
  End;
 faehigkeit('Verf�hren',7,6,7,61,8,21,i,CheckListBox3);

 //-----------------------------------Ungew�hnliche_Kenntnisse-----

   i:=1;
 faehigkeit('Sprechen: Sprache',5,4,5,1,0,0,i,CheckListBox4);
   i:=2;
 faehigkeit('Himmelskunde',5,4,5,21,0,0,i,CheckListBox4);
 faehigkeit('Schreiben: Sprache',5,4,5,21,0,0,i,CheckListBox4);
 faehigkeit('Sprechen: Sprache',5,9,5,1,0,0,i,CheckListBox4);
   i:=3;
 faehigkeit('Balancieren',3,10,3,61,0,0,i,CheckListBox4);
 faehigkeit('Erz�hlen',5,8,5,31,7,31,i,CheckListBox4);
 faehigkeit('Fallenstellen',2,4,2,31,0,0,i,CheckListBox4);
 faehigkeit('Fangen',2,10,2,31,0,0,i,CheckListBox4);
 faehigkeit('Gassenwissen',5,4,5,61,7,31,i,CheckListBox4);
 faehigkeit('Gaukeln',2,8,2,61,0,0,i,CheckListBox4);
 faehigkeit('Geheimzeichen',5,6,5,21,0,0,i,CheckListBox4);
 faehigkeit('Gel�ndelauf',3,10,3,31,0,0,i,CheckListBox4);
 faehigkeit('Klettern',1,10,1,31,3,61,i,CheckListBox4);
 faehigkeit('Laufen',4,4,4,61,0,0,i,CheckListBox4);
 faehigkeit('Lippenlesen',5,4,5,31,0,0,i,CheckListBox4);
 faehigkeit('Menschenkenntnis',5,4,5,31,0,0,i,CheckListBox4);
 faehigkeit('Reiten',3,10,3,21,0,0,i,CheckListBox4);
 faehigkeit('Rudern',1,10,1,21,2,21,i,CheckListBox4);
 faehigkeit('Schlittenfahren',2,10,2,21,0,0,i,CheckListBox4);
 faehigkeit('Schreiben: Sprache',5,9,5,21,0,0,i,CheckListBox4);
 faehigkeit('Schwimmen',3,10,3,11,0,0,i,CheckListBox4);
 faehigkeit('Skifahren',3,10,3,21,0,0,i,CheckListBox4);
 faehigkeit('Sprechen: Sprache',5,12,5,31,0,0,i,CheckListBox4);
 faehigkeit('Springen',1,10,1,31,0,0,i,CheckListBox4);
 faehigkeit('Spurenlesen',5,4,5,31,0,0,i,CheckListBox4);
 faehigkeit('Tauchen',4,10,4,61,3,31,i,CheckListBox4);
 faehigkeit('Trinken',4,(1+(a[4] div 10)),4,1,0,0,i,CheckListBox4);
 faehigkeit('�berleben',5,6,5,21,0,0,i,CheckListBox4);
 faehigkeit('Wagenlenken',2,10,2,21,0,0,i,CheckListBox4);
   i:=4;
 faehigkeit('Athletik',1,4,1,31,4,31,i,CheckListBox4);
 faehigkeit('Baukunde',5,4,5,31,0,0,i,CheckListBox4);
 faehigkeit('Beschatten',3,6,3,61,9,20,i,CheckListBox4);
 faehigkeit('Dichten',5,8,5,61,0,0,i,CheckListBox4);
 faehigkeit('Fallen entdecken',5,4,5,61,0,0,i,CheckListBox4);
 faehigkeit('Fallenmechanik',2,4,2,61,0,0,i,CheckListBox4);
 faehigkeit('Geheimmechanismen �ffnen',5,4,5,61,0,0,i,CheckListBox4);
 faehigkeit('Gl�cksspiel',2,15,2,61,0,0,i,CheckListBox4);
 faehigkeit('Kr�uterkunde',5,4,5,61,0,0,i,CheckListBox4);
 faehigkeit('Naturkunde',5,4,5,61,0,0,i,CheckListBox4);
 faehigkeit('Pflanzenkunde',5,4,5,61,0,0,i,CheckListBox4);
 faehigkeit('Rechnen',5,6,5,81,0,0,i,CheckListBox4);
 faehigkeit('Sch�tzen',5,4,5,61,0,0,i,CheckListBox4);
 faehigkeit('Schleichen',3,6,3,61,0,0,i,CheckListBox4);
 faehigkeit('Schl�sser �ffnen',2,6,2,61,0,0,i,CheckListBox4);
 faehigkeit('Steuern',2,10,2,31,1,21,i,CheckListBox4);
 faehigkeit('Stimmen nachahmen',5,12,5,31,0,0,i,CheckListBox4);
 faehigkeit('Suchen',5,4,5,31,2,31,i,CheckListBox4);
 faehigkeit('Tarnen',3,6,3,31,0,0,i,CheckListBox4);
 faehigkeit('Tierkunde',5,4,5,61,0,0,i,CheckListBox4);
 faehigkeit('Verbergen',5,6,5,61,0,0,i,CheckListBox4);
 faehigkeit('Verh�ren',7,4,7,61,0,0,i,CheckListBox4);
 faehigkeit('Wahrnehmung',5,4,5,61,0,0,i,CheckListBox4);
 faehigkeit('Winden',3,4,3,61,0,0,i,CheckListBox4);
 faehigkeit('Zauberkunde',5,4,5,61,0,0,i,CheckListBox4);
 faehigkeit('Zeichensprache',5,4,5,31,2,21,i,CheckListBox4);
   i:=5;
 faehigkeit('Akrobatik',3,10,3,61,0,0,i,CheckListBox4);
 faehigkeit('Beredsamkeit',7,6,7,61,5,61,i,CheckListBox4);
 faehigkeit('Giftmischen',5,4,5,61,2,31,i,CheckListBox4);
 faehigkeit('Heilkunde',5,4,5,61,0,0,i,CheckListBox4);
 faehigkeit('Kampf in der Schlachtreihe',0,4,0,0,0,0,i,CheckListBox4);
 faehigkeit('Meditieren',10,6,10,21,0,0,i,CheckListBox4);
 faehigkeit('Schauspielern',7,6,7,61,0,0,i,CheckListBox4);
 faehigkeit('Stehlen',2,8,2,61,0,0,i,CheckListBox4);
 faehigkeit('Verkleiden',2,12,2,31,5,31,i,CheckListBox4);
   i:=6;
 faehigkeit('Abrichten',7,6,7,61,0,0,i,CheckListBox4);
 faehigkeit('Beidh�ndiger Kampf',3,3,3,61,0,0,i,CheckListBox4);
 faehigkeit('F�lschen',2,12,2,61,0,0,i,CheckListBox4);
 faehigkeit('Fechten',0,4,0,0,0,0,i,CheckListBox4);
 faehigkeit('Fechten tevarischer Stil',0,4,0,0,0,0,i,CheckListBox4);
 faehigkeit('Kampf in Dunkelheit',3,2,3,61,0,0,i,CheckListBox4);
 faehigkeit('Meucheln',2,6,2,61,1,31,i,CheckListBox4);
 faehigkeit('Scharfschie�en',2,4,2,61,0,0,i,CheckListBox4);
 faehigkeit('Schiffsf�hrung',5,6,5,31,7,61,i,CheckListBox4);
 faehigkeit('Seemannsgang',3,10,3,31,0,0,i,CheckListBox4);
 faehigkeit('Streitwagen lenken',2,10,2,21,0,0,i,CheckListBox4);
   i:=8;
 faehigkeit('Alchemie',5,4,5,81,2,61,i,CheckListBox4);
 faehigkeit('Ballista bedienen',2,4,2,61,5,21,i,CheckListBox4);
 faehigkeit('Bogenkampf zu Pferd',2,10,2,31,0,0,i,CheckListBox4);
 faehigkeit('Gesch�ftst�chtigkeit',5,6,5,31,0,0,i,CheckListBox4);
 faehigkeit('Kampf in Vollr�stung',1,10,1,61,0,0,i,CheckListBox4);
 faehigkeit('Kampf zu Pferd',3,10,3,21,0,0,i,CheckListBox4);
 faehigkeit('Kampf vom Streitwagen',3,10,3,21,0,0,i,CheckListBox4);
 faehigkeit('Kampftaktik',7,6,7,61,5,31,i,CheckListBox4);
 faehigkeit('Katapult bedienen',2,4,2,31,5,31,i,CheckListBox4);
 faehigkeit('Lesen von Zauberschrift',5,6,5,21,0,0,i,CheckListBox4);
 faehigkeit('Schie�en vom Streitwagen',2,10,2,31,0,0,i,CheckListBox4);
 faehigkeit('Thaumatografie',5,4,5,61,0,0,i,CheckListBox4);

 If klasse < 13 Then
  CheckListBox5.Visible:=False
 Else
  Begin
   ShowMessage('Zauber kommen noch');
  End;

 CheckListBox1.Height:=CheckListBox1.Count*13 + 7;
 CheckListBox2.Height:=CheckListBox2.Count*13 + 7;
 CheckListBox3.Height:=CheckListBox3.Count*13 + 7;
 CheckListBox5.Height:=CheckListBox5.Count*13 + 7;

 If CheckListBox1.Height > (CheckListBox2.Height OR CheckListBox3.Height OR CheckListBox5.Height) Then
  hoehe:=CheckListBox1.Height;
 If CheckListBox2.Height > (CheckListBox1.Height OR CheckListBox3.Height OR CheckListBox5.Height) Then
  hoehe:=CheckListBox2.Height;
 If CheckListBox3.Height > (CheckListBox1.Height OR CheckListBox2.Height OR CheckListBox5.Height) Then
  hoehe:=CheckListBox3.Height;
 If CheckListBox5.Height > (CheckListBox1.Height OR CheckListBox2.Height OR CheckListBox3.Height) Then
  hoehe:=CheckListBox5.Height;

 CheckListBox1.Height:=hoehe;
 CheckListBox2.Height:=hoehe;
 CheckListBox3.Height:=hoehe;
 CheckListBox4.Height:=hoehe;
 CheckListBox5.Height:=hoehe;
 Shape1.Height:=hoehe;
 Form3.Height:=hoehe + 100 + Button1.Height + Button5.Height;

 Button1.Top:=CheckListBox1.Height + 45 + Button1.Height;
 Button2.Top:=CheckListBox2.Height + 45 + Button2.Height;
 Button3.Top:=CheckListBox3.Height + 45 + Button3.Height;
 Button5.Top:=CheckListBox1.Height + 50 + Button1.Height + Button5.Height;
end;

procedure TForm3.CheckListBox1ClickCheck(Sender: TObject);
 var i:Byte;
     j:shortString;
begin
 i:=CheckListBox1.ItemIndex;
 j:=CheckListBox1.Items[i][2];

 If CheckListBox1.ItemEnabled[CheckListBox1.ItemIndex] = True Then
  If CheckListBox1.Checked[CheckListBox1.ItemIndex] = True Then
   MPFk:=MPFk - StrToInt(j)
  Else
   MPFk:=MPFk + StrToInt(j);
  
 Label2.Caption:='Fachkenntnisse (' + IntToStr(MPFk) + '/' + IntToStr(PFk) + ')';
end;

procedure TForm3.CheckListBox2ClickCheck(Sender: TObject);
 var i:Byte;
     j:shortString;
begin
 i:=CheckListBox2.ItemIndex;
 j:=CheckListBox2.Items[i][2];

 If CheckListBox2.ItemEnabled[CheckListBox2.ItemIndex] = True Then
  If CheckListBox2.Checked[CheckListBox2.ItemIndex] = True Then
   MPWk:=MPWk - StrToInt(j)
  Else
   MPWk:=MPWk + StrToInt(j);

 Label3.Caption:='Waffenkenntnisse (' + IntToStr(MPWk) + '/' + IntToStr(PWk) + ')';
end;

procedure TForm3.CheckListBox3ClickCheck(Sender: TObject);
 var i:Byte;
     j:shortString;
begin
 i:=CheckListBox3.ItemIndex;
 j:=CheckListBox3.Items[i][2];

 If CheckListBox3.ItemEnabled[CheckListBox3.ItemIndex] = True Then
  If CheckListBox3.Checked[CheckListBox3.ItemIndex] = True Then
   MPAk:=MPAk - StrToInt(j)
  Else
   MPAk:=MPAk + StrToInt(j);

 Label4.Caption:='Allgemeine Kenntnisse (' + IntToStr(MPAk) + '/' + IntToStr(PAk) + ')';
end;

procedure TForm3.CheckListBox4ClickCheck(Sender: TObject);
 var i:Byte;
     j:shortString;
begin
 i:=CheckListBox4.ItemIndex;
 j:=CheckListBox4.Items[i][2];

 If CheckListBox4.ItemEnabled[CheckListBox4.ItemIndex] = True Then
  If CheckListBox4.Checked[CheckListBox4.ItemIndex] = True Then
   MPUk:=MPUk - StrToInt(j)
  Else
   MPUk:=MPUk + StrToInt(j);

 Label5.Caption:='Ungew�hniche Kenntnisse (' + IntToStr(MPUk) + '/' + IntToStr(PUk) + ')';
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form1.Close;
end;



procedure TForm3.Button1Click(Sender: TObject);
begin
 If MPFk > 0 Then
  Begin
   dec(MPFk);
   inc(MPUk);
   Label2.Caption:='Fachkenntnisse (' + IntToStr(MPFk) + '/' + IntToStr(PFk) + ')';
   Label5.Caption:='Ungew�hnliche Kenntnisse (' + IntToStr(MPUk) + '/' + IntToStr(PUk) + ')';
  End;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 If MPWk > 0 Then
  Begin
   dec(MPWk);
   inc(MPUk);
   Label3.Caption:='Waffenkenntnisse (' + IntToStr(MPWk) + '/' + IntToStr(PWk) + ')';
   Label5.Caption:='Ungew�hnliche Kenntnisse (' + IntToStr(MPUk) + '/' + IntToStr(PUk) + ')';
  End;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
 If MPAk > 0 Then
  Begin
   dec(MPAk);
   inc(MPUk);
   Label4.Caption:='Allgemeine Kenntnisse (' + IntToStr(MPAk) + '/' + IntToStr(PAk) + ')';
   Label5.Caption:='Ungew�hnliche Kenntnisse (' + IntToStr(MPUk) + '/' + IntToStr(PUk) + ')';
  End;
end;

procedure TForm3.Button4Click(Sender: TObject);
 var i:Byte;
begin
 MPFk:=PFk;
 MPWk:=PWk;
 MPAk:=PAk;
 MPUk:=PUk;
 MPZk:=PZk;

 Label2.Caption:='Fachkenntnisse (' + IntToStr(MPFk) + '/' + IntToStr(PFk) + ')';
 Label3.Caption:='Waffenkenntnisse (' + IntToStr(MPWk) + '/' + IntToStr(PWk) + ')';
 Label4.Caption:='Allgemeine Kenntnisse (' + IntToStr(MPAk) + '/' + IntToStr(PAk) + ')';
 Label5.Caption:='Ungew�hnliche Kenntnisse (' + IntToStr(MPUk) + '/' + IntToStr(PUk) + ')';
 Label6.Caption:='Zauberkenntnisse (' + IntToStr(MPZk) + '/' + IntToStr(PZk) + ')';
end;



end.
