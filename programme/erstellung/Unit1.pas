unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    Button1: TButton;
    Button3: TButton;
    ListView1: TListView;
    ListView2: TListView;
    RadioGroup4: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure start();
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioGroup4Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  stats,item:TListItem;
  geschlecht,rasse,klasse:Byte;
  r:Array[1..9] Of Byte;
  a:Array[1..6] Of Byte;
  SchB,AusB,AnB,AbB,ZauB,ResGB,ResKB,ResUB:ShortInt;
  Au,pA,Wk,Sb:Byte;
  KGr,KGw:Byte;
  LP,AP,Raufen,Abwehr,Zaubern,ResG,ResK,ResU:Byte;
  B,Hand,SSinn,AFaeh,ZFaeh:Byte;
  Heimat,Stand:Byte;
  PFk,PWk,PAk,PUk,PZk,Alter:Byte;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Randomize;
 RadioGroup1.ItemIndex:=0;
 RadioGroup2.ItemIndex:=0;
 RadioGroup3.ItemIndex:=7;
 RadioGroup4.ItemIndex:=0;
end;

procedure TForm1.start();
begin
 If (RadioGroup1.ItemIndex > -1) AND (RadioGroup2.ItemIndex > -1) AND (RadioGroup3.ItemIndex > -1) AND (RadioGroup4.ItemIndex > -1) Then
  Button1.Enabled:=True
 Else
  Button1.Enabled:=False;
 Button3.Enabled:=False;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
 var i,j:Byte;
     titel:String;
     st:String[3];
begin
 geschlecht:=RadioGroup1.ItemIndex;
 If geschlecht = 1 Then
  For i:=0 To RadioGroup3.Items.Count-1 Do
   Begin
    titel:='';
    st:=RadioGroup3.Items[i][length(RadioGroup3.Items[i]) - 2] + RadioGroup3.Items[i][length(RadioGroup3.Items[i]) - 1] + RadioGroup3.Items[i][length(RadioGroup3.Items[i])];

    If (st[3] = 'e') Then
     Begin
      For j:=1 To length(RadioGroup3.Items[i]) - 1 Do
       titel:=titel + RadioGroup3.Items[i][j];
      RadioGroup3.Items[i]:=titel + 'in';
     End
    Else If (st = 'xer') Then
     Begin
      For j:=1 To length(RadioGroup3.Items[i]) - 3 Do
       titel:=titel + RadioGroup3.Items[i][j];
      RadioGroup3.Items[i]:=titel + 'xe';
     End
    Else If (st[3] = 'r') OR (st[3] = 'g') Then
     RadioGroup3.Items[i]:=RadioGroup3.Items[i] + 'in';
   End
  Else
   For i:=0 To RadioGroup3.Items.Count-1 Do
   Begin
    titel:='';
    st:=RadioGroup3.Items[i][length(RadioGroup3.Items[i]) - 2] + RadioGroup3.Items[i][length(RadioGroup3.Items[i]) - 1] + RadioGroup3.Items[i][length(RadioGroup3.Items[i])];

    If (st = 'rin') Then
     Begin
      For j:=1 To length(RadioGroup3.Items[i]) - 2 Do
       titel:=titel + RadioGroup3.Items[i][j];
      RadioGroup3.Items[i]:=titel;
     End
    Else If (st = 'gin') Then
     Begin
      For j:=1 To length(RadioGroup3.Items[i]) - 2 Do
       titel:=titel + RadioGroup3.Items[i][j];
      RadioGroup3.Items[i]:=titel;
     End
    Else If (st[2] = 'i') AND (st[3] = 'n') Then
     Begin
      For j:=1 To length(RadioGroup3.Items[i]) - 2 Do
       titel:=titel + RadioGroup3.Items[i][j];
      RadioGroup3.Items[i]:=titel + 'e';
     End
    Else If (st = 'xe') Then
     RadioGroup3.Items[i]:=RadioGroup3.Items[i] + 'r';
    End;
 start();
end;

procedure TForm1.RadioGroup2Click(Sender: TObject);
 var i:Byte;
begin
 rasse:=RadioGroup2.ItemIndex;
 RadioGroup3.ItemIndex:=-1;
 For i:=0 To 29 Do
  TRadioButton(RadioGroup3.Controls[i]).Enabled:=False;
 Case RadioGroup2.ItemIndex Of
  0: Begin
      For i:=0 To 29 Do
       TRadioButton(RadioGroup3.Controls[i]).Enabled:=True;
     End;
  1: Begin
      For i:=0 To 29 Do
       TRadioButton(RadioGroup3.Controls[i]).Enabled:=True;
     End;
  2: Begin
      TRadioButton(RadioGroup3.Controls[05]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[07]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[12]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[13]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[17]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[18]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[19]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[20]).Enabled:=True;
     End;
  3: Begin
      TRadioButton(RadioGroup3.Controls[06]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[11]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[12]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[13]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[18]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[21]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[27]).Enabled:=True;
     End;
  4: Begin
      TRadioButton(RadioGroup3.Controls[00]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[05]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[08]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[11]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[12]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[17]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[18]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[19]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[20]).Enabled:=True;
      TRadioButton(RadioGroup3.Controls[29]).Enabled:=True;
     End;
 End;
 start();
end;

procedure TForm1.RadioGroup3Click(Sender: TObject);
begin
 klasse:=RadioGroup3.ItemIndex;
 start();
end;

procedure TForm1.RadioGroup4Click(Sender: TObject);
begin
  heimat:=RadioGroup4.ItemIndex;
  start();
end;

procedure TForm1.Button1Click(Sender: TObject);
 var i,m,n:Byte;
begin
 ListView1.Clear;
 For i:=1 To 6 Do
  Begin
   m:=Random(100)+1;
   n:=Random(100)+1;
   If m > n Then
    a[i]:=m
   Else
    a[i]:=n;
  End;

 Case rasse Of
  1: Begin
      Repeat
       a[3]:=Random(100)+1;
      Until
       a[3] <= 80;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 61) OR (n >= 61);
      If m > n Then
       a[1]:=m
      Else
       a[1]:=n;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 61) OR (n >= 61);
      If m > n Then
       a[4]:=m
      Else
       a[4]:=n;
     End;
  2: Begin
      Repeat
       a[1]:=Random(100)+1;
      Until
       a[1] <= 90;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 81) OR (n >= 81);
      If m > n Then
       a[3]:=m
      Else
       a[3]:=n;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 61) OR (n >= 61);
      If m > n Then
       a[4]:=m
      Else
       a[4]:=n;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 61) OR (n >= 61);
      If m > n Then
       a[5]:=m
      Else
       a[5]:=n;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 61) OR (n >= 61);
      If m > n Then
       a[6]:=m
      Else
       a[6]:=n;
     End;
  3: Begin
      Repeat
       a[1]:=Random(100)+1;
      Until
       a[1] <= 80;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 61) OR (n >= 61);
      If m > n Then
       a[2]:=m
      Else
       a[2]:=n;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 91) OR (n >= 91);
      If m > n Then
       a[3]:=m
      Else
       a[3]:=n;
     End;
  4: Begin
      Repeat
       a[1]:=Random(100)+1;
      Until
       a[1] <= 60;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 81) OR (n >= 81);
      If m > n Then
       a[2]:=m
      Else
       a[2]:=n;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 81) OR (n >= 81);
      If m > n Then
       a[3]:=m
      Else
       a[3]:=n;

      Repeat
       Begin
        m:=Random(100)+1;
        n:=Random(100)+1;
       End;
      Until
       (m >= 31) OR (n >= 31);
      If m > n Then
       a[4]:=m
      Else
       a[4]:=n;
     End;
 End;

 For i:=1 To 6 Do
  Begin
   stats:=ListView1.Items.Add;
   Case i Of
    1:stats.Caption:='St';
    2:stats.Caption:='Gs';
    3:stats.Caption:='Gw';
    4:stats.Caption:='Ko';
    5:stats.Caption:='In';
    6:stats.Caption:='Zt';
   End;
   stats.SubItems.Add(IntToStr(a[i]));
  End;

 Button3.Enabled:=True;
end;

procedure TForm1.Button3Click(Sender: TObject);
 var w:Array[1..4] Of Byte;
     i:Byte;
     st:String;
begin
 ListView2.Clear;

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='SchB';
 SchB:=(a[1] div 20) + (a[2] div 30) - 3;
 item.SubItems.Add('');
 item.SubItems.Add('(' + IntToStr(a[1]) + '/20) + (' + IntToStr(a[2]) + '/30) - 3');
 item.SubItems.Add(IntToStr(SchB));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='AusB';
 AusB:=(a[4] div 10) + (a[1] div 20) - 7;
 item.SubItems.Add('');
 item.SubItems.Add('(' + IntToStr(a[4]) + '/10) + (' + IntToStr(a[1]) + '/20) - 7');
 item.SubItems.Add(IntToStr(AusB));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='B';
 Case rasse Of
  1: Begin
      For i:=1 To 3 Do
       w[i]:=Random(3)+1;
      B:=w[1] + w[2] + w[3] + 12;
      item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]) + ', ' + IntToStr(w[3]));
      item.SubItems.Add(IntToStr(w[1] + w[2] + w[3]) + ' + 12');
     End;
  3..4: Begin
      For i:=1 To 2 Do
       w[i]:=Random(3)+1;
      B:=w[1] + w[2]  + 8;
      item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]));
      item.SubItems.Add(IntToStr(w[1] + w[2]) + ' + 8');
     End;
  else
     Begin
      For i:=1 To 4 Do
       w[i]:=Random(3)+1;
      B:=w[1] + w[2] + w[3] + w[4] + 16;
      item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]) + ', ' + IntToStr(w[3]) + ', ' + IntToStr(w[4]));
      item.SubItems.Add(IntToStr(w[1] + w[2] + w[3] + w[4]) + ' + 16');
     End;
 End;
 item.SubItems.Add(IntToStr(B));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Au';
 Case rasse Of
  1: Begin
      Repeat
       w[1]:=Random(100)+1;
      Until
       w[1] <= 80;
     End;
  2: Begin
      Repeat
       w[1]:=Random(100)+1;
      Until
       w[1] >= 81;
     End;
  else Begin
      w[1]:=Random(100)+1;
     End;
 End;
 Au:=w[1];
 item.SubItems.Add(IntToStr(w[1]));
 item.SubItems.Add('');
 item.SubItems.Add(IntToStr(Au));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='KGr';
 If rasse = 0 Then
  If geschlecht = 0 Then
   Begin
    For i:=1 To 2 Do
     w[i]:=Random(20)+1;
    KGr:=w[1] + w[2] + (a[1] div 10) + 150;
    item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]));
    item.SubItems.Add(IntToStr(w[1] + w[2]) + ' + (' + IntToStr(a[1]) + '/10) + 150cm');
   End
  Else
   Begin
    For i:=1 To 2 Do
     w[i]:=Random(20)+1;
    KGr:=w[1] + w[2] + (a[1] div 10) + 140;
    item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]));
    item.SubItems.Add(IntToStr(w[1] + w[2]) + ' + (' + IntToStr(a[1]) + '/10) + 140cm');
   End
 Else
  Case rasse Of
   1: Begin
       w[1]:=Random(6)+1;
       KGr:=w[1] + (a[1] div 10) + 130;
       item.SubItems.Add(IntToStr(w[1]));
       item.SubItems.Add(IntToStr(w[1]) + ' + (' + IntToStr(a[1]) + '/10) + 130cm');
      End;
   2: Begin
       For i:=1 To 2 Do
        w[i]:=Random(6)+1;
       KGr:=w[1] + w[2] + (a[1] div 10) + 160;
       item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]));
       item.SubItems.Add(IntToStr(w[1] + w[2]) + ' + (' + IntToStr(a[1]) + '/10) + 160cm');
      End;
   3: Begin
       For i:=1 To 2 Do
        w[i]:=Random(6)+1;
       KGr:=w[1] + w[2] + (a[1] div 10) + 100;
       item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]));
       item.SubItems.Add(IntToStr(w[1] + w[2]) + ' + (' + IntToStr(a[1]) + '/10) + 100cm');
      End;
   4: Begin
       w[1]:=Random(6)+1;
       KGr:=w[1] + w[2] + (a[1] div 10) + 90;
       item.SubItems.Add(IntToStr(w[1]));
       item.SubItems.Add(IntToStr(w[1]) + ' + (' + IntToStr(a[1]) + '/10) + 100cm');
      End;
  End;
 item.SubItems.Add(IntToStr(KGr) + 'cm');
 Case KGr Of
  000..165:item.SubItems.Add('klein');
  166..180:item.SubItems.Add('normal');
  181..255:item.SubItems.Add('groﬂ');
 End;

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='KGw';
 If rasse = 0 Then
  If geschlecht = 0 Then
   Begin
    For i:=1 To 4 Do
     w[i]:=Random(6)+1;
    KGw:=w[1] + w[2] + w[3] + w[4] + (a[1] div 10) + KGr - 120;
    item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]) + ', ' + IntToStr(w[3]) + ', ' + IntToStr(w[4]));
    item.SubItems.Add(IntToStr(w[1] + w[2] + w[3] + w[4]) + ' + (' + IntToStr(a[1]) + '/10) + ' + IntToStr(KGr) + 'cm - 120kg');
   End
  Else
   Begin
    For i:=1 To 4 Do
     w[i]:=Random(6)+1;
    KGw:=w[1] + w[2] + w[3] + w[4] - 4 + (a[1] div 10) + KGr - 120;
    item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]) + ', ' + IntToStr(w[3]) + ', ' + IntToStr(w[4]));
    item.SubItems.Add(IntToStr(w[1] + w[2] + w[3] + w[4]) + ' - 4 + (' + IntToStr(a[1]) + '/10) + ' + IntToStr(KGr) + 'cm - 120kg');
   End
 Else
  Case rasse Of
   1: Begin
       For i:=1 To 4 Do
        w[i]:=Random(6)+1;
       KGw:=w[1] + w[2] + w[3] + w[4]  + (a[1] div 10) + KGr - 90;
       item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]) + ', ' + IntToStr(w[3]) + ', ' + IntToStr(w[4]));
       item.SubItems.Add(IntToStr(w[1] + w[2] + w[3] + w[4]) + ' + (' + IntToStr(a[1]) + '/10) + ' + IntToStr(KGr) + 'cm - 90kg');
      End;
   2: Begin
       For i:=1 To 4 Do
        w[i]:=Random(6)+1;
       KGw:=w[1] + w[2] + w[3] + w[4] - 8 + (a[1] div 10) + KGr - 120;
       item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]) + ', ' + IntToStr(w[3]) + ', ' + IntToStr(w[4]));
       item.SubItems.Add(IntToStr(w[1] + w[2] + w[3] + w[4]) + ' - 8 + (' + IntToStr(a[1]) + '/10) + ' + IntToStr(KGr) + 'cm - 120kg');
      End;
   3: Begin
       For i:=1 To 3 Do
        w[i]:=Random(6)+1;
       KGw:=w[1] + w[2] + w[3] + 3 + (a[1] div 10) + KGr - 90;
       item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]) + ', ' + IntToStr(w[3]));
       item.SubItems.Add(IntToStr(w[1] + w[2] + w[3]) + ' + 3 + (' + IntToStr(a[1]) + '/10) + ' + IntToStr(KGr) + 'cm - 90kg');
      End;
   4: Begin
       For i:=1 To 3 Do
        w[i]:=Random(6)+1;
       KGw:=w[1] + w[2] + w[3] + (a[1] div 10) + KGr - 90;
       item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]) + ', ' + IntToStr(w[3]));
       item.SubItems.Add(IntToStr(w[1] + w[2] + w[3]) + ' + (' + IntToStr(a[1]) + '/10) + ' + IntToStr(KGr) + 'cm - 90kg');
      End;
  End;
 item.SubItems.Add(IntToStr(KGw) + 'kg');

 If (rasse = 0) OR (rasse = 2) Then
  If (KGw / (KGr - 110)) < 1 Then
   item.SubItems.Add('schlank')
  Else If (KGw / (KGr - 110)) > 1.1 Then
   item.SubItems.Add('breit')
  Else
   item.SubItems.Add('normal')
 Else
  If (KGw / (KGr - 70)) < 1 Then
   item.SubItems.Add('schlank')
  Else If (KGw / (KGr - 70)) > 1.1 Then
   item.SubItems.Add('breit')
  Else
   item.SubItems.Add('normal');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Hand';
 w[1]:=Random(20)+1;
 item.SubItems.Add(IntToStr(w[1]));
 item.SubItems.Add('');
 If rasse < 4 Then
  Case w[1] Of
   01..15: item.SubItems.Add('Rechtsh‰nder');
   16..19: item.SubItems.Add('Linksh‰nder');
       20: item.SubItems.Add('Beidh‰nderh‰nder');
  End
 Else
  item.SubItems.Add('Beidh‰nder');
 If rasse < 4 Then
  item.SubItems.Add('')
 Else
  item.SubItems.Add('Gnome sind immer Beidh‰nder');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='pA';
 w[1]:=Random(100)+1;
 pA:=w[1] + 3*((a[5] div 10) + (Au div 10)) - 30;
 item.SubItems.Add(IntToStr(w[1]));
 item.SubItems.Add(IntToStr(w[1]) + ' + 3 x (' + IntToStr(a[5]) + '/10 + ' + IntToStr(Au) + '/10) - 30');
 If pA > 200 Then
  pA:=1;
 If pA > 100 Then
  pA:=100;
 item.SubItems.Add(IntToStr(pA));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Wk';
 w[1]:=Random(100)+1;
 Wk:=w[1] + 3*((a[4] div 10) + (a[5] div 10)) - 40;
 item.SubItems.Add(IntToStr(w[1]));
 item.SubItems.Add(IntToStr(w[1]) + ' + 3 x (' + IntToStr(a[4]) + '/10 + ' + IntToStr(a[5]) + '/10) - 40');
 If Wk > 200 Then
  Wk:=1;
 If Wk > 100 Then
  Wk:=100;
 item.SubItems.Add(IntToStr(Wk));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Sb';
 w[1]:=Random(100)+1;
 item.SubItems.Add(IntToStr(w[1]));

 If (klasse = 0) OR (klasse = 16) OR (klasse = 17) Then
  Begin
    Sb:=w[1] + 3*((a[5] div 10) + (Wk div 10));
    item.SubItems.Add(IntToStr(w[1]) + ' + 3 x (' + IntToStr(a[5]) + '/10 + ' + IntToStr(Wk) + '/10)');
  End
 Else If (klasse = 5) OR (klasse = 11) Then
  Begin
    Sb:=w[1] + 3*((a[5] div 10) + (Wk div 10)) - 50;
    item.SubItems.Add(IntToStr(w[1]) + ' + 3 x (' + IntToStr(a[5]) + '/10 + ' + IntToStr(Wk) + '/10) - 50');
  End
 Else
  Begin
    Sb:=w[1] + 3*((a[5] div 10) + (Wk div 10)) - 30;
    item.SubItems.Add(IntToStr(w[1]) + ' + 3 x (' + IntToStr(a[5]) + '/10 + ' + IntToStr(Wk) + '/10) - 30');
  End;
 If Sb > 200 Then
  Sb:=1;
 If Sb > 100 Then
  Sb:=100;
 item.SubItems.Add(IntToStr(Sb));
 Case klasse Of
  00: item.SubItems.Add('Assasinen sind eine willenstarke Klasse');
  05: item.SubItems.Add('Gl¸cksritter sind eine willensschwache Klasse');
  11: item.SubItems.Add('Spitzbuben sind eine willensschwache Klasse');
  16: item.SubItems.Add('Beschwˆrer sind eine willenstarke Klasse');
  17: item.SubItems.Add('Druiden sind eine willenstarke Klasse');
 End;

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='LP';
 w[1]:=Random(6)+1;
 item.SubItems.Add(IntToStr(w[1]));
 Case rasse Of
  0: Begin
      LP:=(a[4] div 10) + w[1] + 4;
      item.SubItems.Add('(' + IntToStr(a[4]) + '/10) + ' + IntToStr(w[1]) + ' + 4');
     End;
  1: Begin
      LP:=(a[4] div 10) + w[1] + 4 + 1;
      item.SubItems.Add('(' + IntToStr(a[4]) + '/10) + ' + IntToStr(w[1]) + ' + 4 + 1');
     End;
  2: Begin
      LP:=(a[4] div 10) + w[1] + 4 + 1;
      item.SubItems.Add('(' + IntToStr(a[4]) + '/10) + ' + IntToStr(w[1]) + ' + 4 + 1');
     End;
  3: Begin
      LP:=(a[4] div 10) + w[1] + 4 - 2;
      item.SubItems.Add('(' + IntToStr(a[4]) + '/10) + ' + IntToStr(w[1]) + ' + 4 - 2');
     End;
  4: Begin
      LP:=(a[4] div 10) + w[1] + 4 - 4;
      item.SubItems.Add('(' + IntToStr(a[4]) + '/10) + ' + IntToStr(w[1]) + ' + 4 - 4');
     End;
 End;
 item.SubItems.Add(IntToStr(LP));

 Case rasse Of
  1: item.SubItems.Add('Zwerge halten Wunden besser aus');
  2: item.SubItems.Add('Elfen halten Wunden besser aus');
  3: item.SubItems.Add('Halblinge halten Wunden schlechter aus');
  4: item.SubItems.Add('Gnome halten Wunden viel schlechter aus');
 End;

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='AP';
 w[1]:=Random(6)+1;
 item.SubItems.Add(IntToStr(w[1]));
 If (klasse = 1) OR  (klasse = 2) OR (klasse = 3) OR (klasse = 7) OR (klasse = 8) OR (klasse = 10) OR (klasse = 12) Then
  Begin
   Case rasse Of
    0..2: Begin
        AP:=w[1] + 4 + AusB;
        item.SubItems.Add(IntToStr(w[1]) + ' + 4 + ' + IntToStr(AusB));
        item.SubItems.Add(IntToStr(AP));
        item.SubItems.Add('K‰mpfer sind weniger schnell erschˆpft');
       End;
    3: Begin
        AP:=w[1] + 4 + AusB - 1;
        item.SubItems.Add(IntToStr(w[1]) + ' + 4 + ' + IntToStr(AusB) + ' - 1');
        item.SubItems.Add(IntToStr(AP));
        item.SubItems.Add('K‰mpfer sind weniger schnell erschˆpft, Halblinge sind schneller erschˆpft');
       End;
    4: Begin
        AP:=w[1] + 4 + AusB - 2;
        item.SubItems.Add(IntToStr(w[1]) + ' + 4 + ' + IntToStr(AusB) + ' - 1');
        item.SubItems.Add(IntToStr(AP));
        item.SubItems.Add('K‰mpfer sind weniger schnell erschˆpft, Gnome sind viel schneller erschˆpft');
       End;
   End;
  End
 Else If (klasse = 0) OR  (klasse = 4) OR (klasse = 5) OR (klasse = 6) OR (klasse = 9) OR (klasse = 11) OR (klasse = 13) OR (klasse = 14) OR (klasse = 15) OR (klasse = 28) Then
  Begin
   Case rasse Of
    0..2: Begin
        AP:=w[1] + 3 + AusB;
        item.SubItems.Add(IntToStr(w[1]) + ' + 3 + ' + IntToStr(AusB));
        item.SubItems.Add(IntToStr(AP));
        item.SubItems.Add('');
       End;
    3: Begin
        AP:=w[1] + 3 + AusB - 1;
        item.SubItems.Add(IntToStr(w[1]) + ' + 3 + ' + IntToStr(AusB) + ' - 1');
        item.SubItems.Add(IntToStr(AP));
        item.SubItems.Add('Halblinge sind schneller erschˆpft');
       End;
    4: Begin
        AP:=w[1] + 3 + AusB - 2;
        item.SubItems.Add(IntToStr(w[1]) + ' + 3 + ' + IntToStr(AusB) + ' - 1');
        item.SubItems.Add(IntToStr(AP));
        item.SubItems.Add('Gnome sind viel schneller erschˆpft');
       End;
   End;
  End
 Else
  Begin
   Case rasse Of
    0..2: Begin
        AP:=w[1] + 2 + AusB;
        item.SubItems.Add(IntToStr(w[1]) + ' + 3 + ' + IntToStr(AusB));
        item.SubItems.Add(IntToStr(AP));
        item.SubItems.Add('Zauberer sind schneller erschˆpft');
       End;
    3: Begin
        AP:=w[1] + 2 + AusB - 1;
        item.SubItems.Add(IntToStr(w[1]) + ' + 3 + ' + IntToStr(AusB) + ' - 1');
        item.SubItems.Add(IntToStr(AP));
        item.SubItems.Add('Zauberer sind schneller erschˆpft, Halblinge sind schneller erschˆpft');
       End;
    4: Begin
        AP:=w[1] + 2 + AusB - 2;
        item.SubItems.Add(IntToStr(w[1]) + ' + 3 + ' + IntToStr(AusB) + ' - 1');
        item.SubItems.Add(IntToStr(AP));
        item.SubItems.Add('Zauberer sind schneller erschˆpft, Gnome sind viel schneller erschˆpft');
       End;
   End;
  End;

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='AnB';
  item.SubItems.Add('');
 Case a[2] Of
   01..05: AnB:=-2;
   06..20: AnB:=-1;
   21..80: AnB:=0;
   81..95: AnB:=1;
  96..100: AnB:=2;
 End;
 item.SubItems.Add('Gs = ' + IntToStr(a[2]));
 item.SubItems.Add(IntToStr(AnB));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Raufen';
 item.SubItems.Add('');
 If rasse = 1 Then
  Begin
   Raufen:=((a[1] + a[3]) div 20) + AnB + 1;
   item.SubItems.Add('(' + IntToStr(a[1]) + ' + ' + IntToStr(a[3]) + ')/20 + ' + IntToStr(AnB) + ' + 1');
  End
 Else
  Begin
   Raufen:=((a[1] + a[3]) div 20) + AnB;
   item.SubItems.Add('(' + IntToStr(a[1]) + ' + ' + IntToStr(a[3]) + ')/20 + ' +  IntToStr(AnB));
  End;
 item.SubItems.Add(IntToStr(Raufen));
 If rasse = 1 Then
  item.SubItems.Add('Zwerge kˆnnen besser Raufen')
 Else
  item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='AbB';
 item.SubItems.Add('');
 Case a[3] Of
   01..05: AbB:=-2;
   06..20: AbB:=-1;
   21..80: AbB:=0;
   81..95: AbB:=1;
  96..100: AbB:=2;
 End;
 item.SubItems.Add('Gw = ' + IntToStr(a[3]));
 item.SubItems.Add(IntToStr(AbB));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Abwehr';
 item.SubItems.Add('');
 Abwehr:=11 + AbB;
 item.SubItems.Add('11 + ' + IntToStr(AbB));;
 item.SubItems.Add(IntToStr(Abwehr));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='ZauB';
 item.SubItems.Add('');
 Case a[6] Of
   01..05: ZauB:=-3;
   06..20: ZauB:=-2;
   21..40: ZauB:=-1;
   41..60: ZauB:=0;
   61..80: ZauB:=1;
   81..95: ZauB:=2;
   96..99: ZauB:=3;
      100: ZauB:=4;
 End;
 item.SubItems.Add('Zt = ' + IntToStr(a[6]));
 item.SubItems.Add(IntToStr(ZauB));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Zaubern';
 item.SubItems.Add('');
 If klasse > 12 Then
  Begin
   Zaubern:=10 + ZauB;
   item.SubItems.Add('10 + ' + IntToStr(ZauB));
  End
 Else
  Begin
   Zaubern:=2 + ZauB;
   item.SubItems.Add('2 + ' + IntToStr(ZauB));
  End;
 item.SubItems.Add(IntToStr(Zaubern));
 If klasse > 12 Then
  item.SubItems.Add('')
 Else
  item.SubItems.Add('K‰mpfer haben das Zaubern nie gelernt');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='ResGB';
 item.SubItems.Add('');
 If a[5] > a[6] Then
  Begin
   Case a[5] Of
     01..05: Begin
              Case rasse Of
                  0: ResGB:=-2;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=0
                      Else
                       ResGB:=1
                     End;
                  2: ResGB:=2;
               3..4: ResGB:=3;
              End;
             End;
     06..20: Begin
              Case rasse Of
                  0: ResGB:=-1;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=1
                      Else
                       ResGB:=2
                     End;
                  2: ResGB:=3;
               3..4: ResGB:=4;
              End;
             End;
     21..80: Begin
              Case rasse Of
                  0: ResGB:=0;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=2
                      Else
                       ResGB:=3
                     End;
                  2: ResGB:=4;
               3..4: ResGB:=5;
              End;
             End;
     81..95: Begin
              Case rasse Of
                  0: ResGB:=1;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=3
                      Else
                       ResGB:=4
                     End;
                  2: ResGB:=5;
               3..4: ResGB:=6;
              End;
             End;
    96..100: Begin
              Case rasse Of
                  0: ResGB:=2;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=4
                      Else
                       ResGB:=5
                     End;
                  2: ResGB:=6;
               3..4: ResGB:=7;
              End;
             End;
   End;
  item.SubItems.Add('Zt < In = ' + IntToStr(a[5]));
 End
 Else
  Begin
   Case a[6] Of
     01..05: Begin
              Case rasse Of
                  0: ResGB:=-2;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=0
                      Else
                       ResGB:=1
                     End;
                  2: ResGB:=2;
               3..4: ResGB:=3;
              End;
             End;
     06..20: Begin
              Case rasse Of
                  0: ResGB:=-1;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=1
                      Else
                       ResGB:=2
                     End;
                  2: ResGB:=3;
               3..4: ResGB:=4;
              End;
             End;
     21..80: Begin
              Case rasse Of
                  0: ResGB:=0;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=2
                      Else
                       ResGB:=3
                     End;
                  2: ResGB:=4;
               3..4: ResGB:=5;
              End;
             End;
     81..95: Begin
              Case rasse Of
                  0: ResGB:=1;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=3
                      Else
                       ResGB:=4
                     End;
                  2: ResGB:=5;
               3..4: ResGB:=6;
              End;
             End;
     96..99: Begin
              Case rasse Of
                  0: ResGB:=2;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=4
                      Else
                       ResGB:=5
                     End;
                  2: ResGB:=6;
               3..4: ResGB:=7;
              End;
             End;
        100: Begin
              Case rasse Of
                  0: ResGB:=3;
                  1: Begin
                      If a[6] < 100 Then
                       ResGB:=5
                      Else
                       ResGB:=6
                     End;
                  2: ResGB:=7;
               3..4: ResGB:=8;
              End;
             End;
   End;
  item.SubItems.Add('In < Zt = ' + IntToStr(a[6]));
  End;
 
 item.SubItems.Add(IntToStr(ResGB));
 Case rasse Of
  1: item.SubItems.Add('Zwerge halten Geistesmagie sehr gut aus');
  2: Begin
      If a[6] < 100 Then
       item.SubItems.Add('Elfen halten Geistesmagie gut aus')
      Else
       item.SubItems.Add('Mit hohem Zaubertalent halten Elfen Geistesmagie noch besser aus');
     End;
  3: item.SubItems.Add('Halblinge halten Geistesmagie unglaublich gut aus');
  4: item.SubItems.Add('Gnome halten Geistesmagie unglaublich gut aus');
 End;

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='ResKB';
 item.SubItems.Add('');
 If a[4] > a[6] Then
  Begin
   Case a[4] Of
     01..05: Begin
              Case rasse Of
                  0: ResKB:=-2;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=0
                      Else
                       ResKB:=1
                     End;
                  2: ResKB:=2;
               3..4: ResKB:=3;
              End;
             End;
     06..20: Begin
              Case rasse Of
                  0: ResKB:=-1;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=1
                      Else
                       ResKB:=2
                     End;
                  2: ResKB:=3;
               3..4: ResKB:=4;
              End;
             End;
     21..80: Begin
              Case rasse Of
                  0: ResKB:=0;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=2
                      Else
                       ResKB:=3
                     End;
                  2: ResKB:=4;
               3..4: ResKB:=5;
              End;
             End;
     81..95: Begin
              Case rasse Of
                  0: ResKB:=1;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=3
                      Else
                       ResKB:=4
                     End;
                  2: ResKB:=5;
               3..4: ResKB:=6;
              End;
             End;
    96..100: Begin
              Case rasse Of
                  0: ResKB:=2;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=4
                      Else
                       ResKB:=5
                     End;
                  2: ResKB:=6;
               3..4: ResKB:=7;
              End;
             End;
   End;
  item.SubItems.Add('Zt < Ko = ' + IntToStr(a[4]));
 End
 Else
  Begin
   Case a[6] Of
     01..05: Begin
              Case rasse Of
                  0: ResKB:=-2;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=0
                      Else
                       ResKB:=1
                     End;
                  2: ResKB:=2;
               3..4: ResKB:=3;
              End;
             End;
     06..20: Begin
              Case rasse Of
                  0: ResKB:=-1;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=1
                      Else
                       ResKB:=2
                     End;
                  2: ResKB:=3;
               3..4: ResKB:=4;
              End;
             End;
     21..80: Begin
              Case rasse Of
                  0: ResKB:=0;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=2
                      Else
                       ResKB:=3
                     End;
                  2: ResKB:=4;
               3..4: ResKB:=5;
              End;
             End;
     81..95: Begin
              Case rasse Of
                  0: ResKB:=1;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=3
                      Else
                       ResKB:=4
                     End;
                  2: ResKB:=5;
               3..4: ResKB:=6;
              End;
             End;
     96..99: Begin
              Case rasse Of
                  0: ResKB:=2;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=4
                      Else
                       ResKB:=5
                     End;
                  2: ResKB:=6;
               3..4: ResKB:=7;
              End;
             End;
        100: Begin
              Case rasse Of
                  0: ResKB:=3;
                  1: Begin
                      If a[6] < 100 Then
                       ResKB:=5
                      Else
                       ResKB:=6
                     End;
                  2: ResKB:=7;
               3..4: ResKB:=8;
              End;
             End;
   End;
  item.SubItems.Add('Ko < Zt = ' + IntToStr(a[6]));
  End;

 item.SubItems.Add(IntToStr(ResKB));
 Case rasse Of
  1: item.SubItems.Add('Zwerge halten Kˆrpermagie sehr gut aus');
  2: Begin
      If a[6] < 100 Then
       item.SubItems.Add('Elfen halten Kˆrpermagie gut aus')
      Else
       item.SubItems.Add('Mit hohem Zaubertalent halten Elfen Kˆrpermagie noch besser aus');
     End;
  3: item.SubItems.Add('Halblinge halten Kˆrpermagie unglaublich gut aus');
  4: item.SubItems.Add('Gnome halten Kˆrpermagie unglaublich gut aus');
 End;

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='ResUB';
 item.SubItems.Add('');
 Case a[3] Of
   01..05: Begin
            Case rasse Of
             0..1: ResUB:=-1;
                2: ResUB:=0;
             3..4: ResUB:=1;
            End;
           End;
   06..20: Begin
            Case rasse Of
             0..1: ResUB:=0;
                2: ResUB:=1;
             3..4: ResUB:=2;
            End;
           End;
   21..80: Begin
            Case rasse Of
             0..1: ResUB:=1;
                2: ResUB:=2;
             3..4: ResUB:=3;
            End;
           End;
   81..95: Begin
            Case rasse Of
             0..1: ResUB:=2;
                2: ResUB:=3;
             3..4: ResUB:=4;
            End;
           End;
  96..100: Begin
            Case rasse Of
             0..1: ResUB:=3;
                2: ResUB:=4;
             3..4: ResUB:=5;
            End;
           End;
 End;
 item.SubItems.Add('Gw = ' + IntToStr(a[3]));
 item.SubItems.Add(IntToStr(ResUB));
 Case rasse Of
  2: item.SubItems.Add('Elfen halten Umgebungsmagie gut aus');
  3: item.SubItems.Add('Halblinge halten Umgebungsmagie unglaublich gut aus');
  4: item.SubItems.Add('Gnome halten Umgebungsmagie unglaublich gut aus');
 End;

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Resistenz';
 item.SubItems.Add('');
 If klasse < 16 Then
  Begin
   ResG:=10 + ResGB;
   ResK:=12 + ResKB;
   ResU:=10 + ResUB;
   item.SubItems.Add('(10 + ' + IntToStr(ResGB) + ' | 12 + ' + IntToStr(ResKB) + ' | 10 + ' + IntToStr(ResUB) + ')');
  End
 Else
  Begin
   ResG:=13 + ResGB;
   ResK:=13 + ResKB;
   ResU:=13 + ResUB;
   item.SubItems.Add('(13 + ' + IntToStr(ResGB) + ' | 13 + ' + IntToStr(ResKB) + ' | 13 + ' + IntToStr(ResUB) + ')');
  End;
 item.SubItems.Add('(' + IntToStr(ResG) + ' | ' + IntToStr(ResK) + ' | ' + IntToStr(ResU) + ')');
 If klasse < 16 Then
  item.SubItems.Add('K‰mpfer haben einen gest‰hlten Kˆrper')
 Else
  item.SubItems.Add('Zauberer haben ihre Resistenzen in allen Varianten verbessert');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Sechster Sinn';
 item.SubItems.Add('');
 SSinn:=a[6] div 25;
 item.SubItems.Add(IntToStr(a[6]) + '/25');
 item.SubItems.Add(IntToStr(SSinn));
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Angeborene F‰higkeit';
 w[1]:=Random(100)+1;
 item.SubItems.Add(IntToStr(w[1]));
 item.SubItems.Add('');
 AFaeh:=w[1];
 ZFaeh:=0;
 Case AFaeh Of
  01..02: item.SubItems.Add('Sehen +4');
  03..04: item.SubItems.Add('Hˆren +4');
  05..06: item.SubItems.Add('Riechen +4)');
  07..08: item.SubItems.Add('Schmecken +4)');
  09..10: item.SubItems.Add('Tasten +4');
  11..20: item.SubItems.Add('Sehen +10');
  21..30: item.SubItems.Add('Hˆren +10');
  31..40: item.SubItems.Add('Riechen +10');
  41..50: item.SubItems.Add('Schmecken +10');
  51..60: item.SubItems.Add('Tasten +10');
  61..65: item.SubItems.Add('Sechster Sinn +6');
  66..70: item.SubItems.Add('Berserkergang +' + IntToStr(18 - (Wk div 5)));
  71..75: item.SubItems.Add('Gute Reflexe +9');
  76..80: item.SubItems.Add('Nachtsicht +8');
  81..85: item.SubItems.Add('Richtungssinn +12');
  86..90: item.SubItems.Add('Robustheit +9');
  91..95: item.SubItems.Add('Wachgabe +6');
  96..99: item.SubItems.Add('Einpr‰gen +4');
     100: Begin
            Form2.Show;
            Form2.Left:=Form1.Width div 2;
            Form2.Top:=Form1.Height div 2;
            item.SubItems.Add('');
            item.SubItems.Add('Freie Wahl einer F‰higkeit');
            item:=ListView2.Items.Add;
            item.Caption:='Zus‰tzliche F‰higkeit';
            w[1]:=Random(100)+1;
            ZFaeh:=w[1];
            item.SubItems.Add(IntToStr(w[1]));
            item.SubItems.Add('');
            Case ZFaeh Of
             01..02: item.SubItems.Add('Sehen +4');
             03..04: item.SubItems.Add('Hˆren +4');
             05..06: item.SubItems.Add('Riechen +4)');
             07..08: item.SubItems.Add('Schmecken +4)');
             09..10: item.SubItems.Add('Tasten +4');
             11..20: item.SubItems.Add('Sehen +10');
             21..30: item.SubItems.Add('Hˆren +10');
             31..40: item.SubItems.Add('Riechen +10');
             41..50: item.SubItems.Add('Schmecken +10');
             51..60: item.SubItems.Add('Tasten +10');
             61..65: item.SubItems.Add('Sechster Sinn +6');
             66..70: item.SubItems.Add('Berserkergang +' + IntToStr(18 - (Wk div 5)));
             71..75: item.SubItems.Add('Gute Reflexe +9');
             76..80: item.SubItems.Add('Nachtsicht +8');
             81..85: item.SubItems.Add('Richtungssinn +12');
             86..90: item.SubItems.Add('Robustheit +9');
             91..95: item.SubItems.Add('Wachgabe +6');
            96..100: item.SubItems.Add('Einpr‰gen +4');
           End;
          End;
 End;

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Heimat';
 item.SubItems.Add('');
 item.SubItems.Add('');
 If heimat = 0 Then
  item.SubItems.Add('Land')
 Else
  item.SubItems.Add('Stadt');
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Stand';
 w[1]:=Random(100)+1;
 item.SubItems.Add(IntToStr(w[1]));
 If (klasse = 13) OR (klasse = 16) OR (klasse = 21) OR (klasse = 22) OR (klasse = 23) OR (klasse = 24) OR (klasse = 25) OR (klasse = 26) OR (klasse = 27) Then
  Begin
   Stand:=w[1] + 20;
   item.SubItems.Add(IntToStr(w[1]) + ' + 20');
  End
 Else If (klasse = 17) OR (klasse = 18) OR (klasse = 20) OR (klasse = 29) Then
  Begin
   Stand:=w[1] + 10;
   item.SubItems.Add(IntToStr(w[1]) + ' + 10');
  End
 Else If (klasse = 0) OR (klasse = 6) OR (klasse = 8) OR (klasse = 12) Then
  Begin
   Stand:=w[1] - 10;
   item.SubItems.Add(IntToStr(w[1]) + ' - 20');
  End
 Else If (klasse = 11) Then
  Begin
   Stand:=w[1] - 20;
   item.SubItems.Add(IntToStr(w[1]) + ' - 20');
  End
 Else
  Begin
   Stand:=w[1];
   item.SubItems.Add(IntToStr(w[1]) + ' + 0');
  End;

 If Stand > 200 Then
  Stand:=1;
 If Stand > 100 Then
  Stand:=100;
  
 Case Stand Of
   01..10: item.SubItems.Add('Unfrei');
   11..50: item.SubItems.Add('Volk');
   51..90: item.SubItems.Add('Mittelschicht');
  91..100: item.SubItems.Add('Adel');
 End;

 If (klasse = 13) OR (klasse = 16) OR (klasse = 21) OR (klasse = 22) OR (klasse = 23) OR (klasse = 24) OR (klasse = 25) OR (klasse = 26) OR (klasse = 27) Then
  item.SubItems.Add('Barden, Beschwˆrer und Priester stehen meist sehr weit oben')
 Else If (klasse = 17) OR (klasse = 18) OR (klasse = 20) OR (klasse = 29) Then
  item.SubItems.Add('Druiden, Heiler, Magier und Thauaturgen stehen meist weiter oben')
 Else If (klasse = 0) OR (klasse = 6) OR (klasse = 8) OR (klasse = 12) Then
  item.SubItems.Add('Assassinen, H‰ndler, Kundschafter und Waldl‰ufer stehen meist weiter unten')
 Else If (klasse = 11) Then
  item.SubItems.Add('Spitzbuben stehen meist sehr weit unten');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Fachkenntnisspunkte';
 For i:=1 To 2 Do
  w[i]:=Random(6)+1;
 item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]));
 PFk:=w[1] + w[2];
 item.SubItems.Add(IntToStr(w[1]) + ' + ' + IntToStr(w[2]));
 item.SubItems.Add(IntToStr(PFk) + ' Fkp');
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Waffenkenntnisspunkte';
 For i:=1 To 2 Do
  w[i]:=Random(6)+1;
 item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]));
 PWk:=w[1] + w[2];
 item.SubItems.Add(IntToStr(w[1]) + ' + ' + IntToStr(w[2]));
 item.SubItems.Add(IntToStr(PWk) + ' Wkp');
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Allgemeine Kenntnisspunkte';
 w[1]:=Random(6)+1;
 item.SubItems.Add(IntToStr(w[1]));
 PAk:=w[1] + 1;
 item.SubItems.Add(IntToStr(w[1]) + ' + 1');
 item.SubItems.Add(IntToStr(PAk) + ' Akp');
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Ungewˆhnliche Kenntnisspunkte';
 w[1]:=Random(6)+1;
 item.SubItems.Add(IntToStr(w[1]));
 PUk:=w[1];
 item.SubItems.Add(IntToStr(w[1]));
 item.SubItems.Add(IntToStr(PUk) + ' Ukp');
 item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Zauberkenntnisspunkte';
 If klasse > 12 Then
  Begin
   For i:=1 To 2 Do
    w[i]:=Random(6)+1;
   item.SubItems.Add(IntToStr(w[1]) + ', ' + IntToStr(w[2]));
   PZk:=w[1] + w[2];
   item.SubItems.Add(IntToStr(w[1]) + ' + ' + IntToStr(w[2]));
  End
 Else
  Begin
   item.SubItems.Add('/');
   PZk:=0;;
   item.SubItems.Add('/');
  End;
 item.SubItems.Add(IntToStr(PZk) + ' Zkp');
 If klasse < 13 Then
  item.SubItems.Add('K‰mpferklassen bekommen keine Zauberkenntnispunkte')
 Else
  item.SubItems.Add('');

 //------------------------------------------------------------

 item:=ListView2.Items.Add;
 item.Caption:='Mindestalter';
 item.SubItems.Add('');
 Alter:=16 + ((PFk + PWk + PAk + PUk + PZk) div 4);
 If klasse < 13 Then
  item.SubItems.Add('16 + (' + IntToStr(PFk) + ' + ' + IntToStr(PWk) + ' + ' + IntToStr(PAk) + ' + ' + IntToStr(PUk) + ')/4')
 Else
  item.SubItems.Add('16 + (' + IntToStr(PFk) + ' + ' + IntToStr(PWk) + ' + ' + IntToStr(PAk) + ' + ' + IntToStr(PUk) + ' + ' + IntToStr(PZk) + ')/4');

 item.SubItems.Add(IntToStr(Alter) + ' Jahre');
 item.SubItems.Add('');

 //------------------------------------------------------------

 If Form2.Visible = False Then
  Form3.Show;
 Form3.Left:=Form1.Left;
 Form3.Top:=Form1.Top + 155;

end;

end.
