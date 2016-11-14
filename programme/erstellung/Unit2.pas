unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;
  faehi:ShortString;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin
 Form1.Enabled:=False;
 ComboBox1.Items[11]:='Berserkergang +' + IntToStr(18-(Wk div 5));
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 Label5.Visible:=True;
 Button1.Visible:=True;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 If ComboBox1.ItemIndex >= 0 Then
  Begin
   Case ComboBox1.ItemIndex Of
    00: Begin
         AFaeh:=01;
         Form1.ListView2.Items[23].SubItems[2]:=('Sehen +4');
        End;
    01: Begin
         AFaeh:=03;
         Form1.ListView2.Items[23].SubItems[2]:=('H�ren +4');
        End;
    02: Begin
         AFaeh:=05;
         Form1.ListView2.Items[23].SubItems[2]:=('Riechen +4');
        End;
    03: Begin
         AFaeh:=07;
         Form1.ListView2.Items[23].SubItems[2]:=('Schmecken +4');
        End;
    04: Begin
         AFaeh:=09;
         Form1.ListView2.Items[23].SubItems[2]:=('Tasten +4');
        End;
    05: Begin
         AFaeh:=11;
         Form1.ListView2.Items[23].SubItems[2]:=('Sehen +10');
        End;
    06: Begin
         AFaeh:=21;
         Form1.ListView2.Items[23].SubItems[2]:=('H�ren +10');
        End;
    07: Begin
         AFaeh:=31;
         Form1.ListView2.Items[23].SubItems[2]:=('Riechen +10');
        End;
    08: Begin
         AFaeh:=41;
         Form1.ListView2.Items[23].SubItems[2]:=('Schmecken +10');
        End;
    09: Begin
         AFaeh:=51;
         Form1.ListView2.Items[23].SubItems[2]:=('Tasten +10');
        End;
    10: Begin
         AFaeh:=61;
         Form1.ListView2.Items[23].SubItems[2]:=('Sechster Sinn +6');
        End;
    11: Begin
         AFaeh:=66;
         Form1.ListView2.Items[23].SubItems[2]:=('Berserkergang +' + IntToStr(18 - (Wk div 5)));
        End;
    12: Begin
         AFaeh:=71;
         Form1.ListView2.Items[23].SubItems[2]:=('Gute Reflexe +9');
        End;
    13: Begin
         AFaeh:=76;
         Form1.ListView2.Items[23].SubItems[2]:=('Nachsicht +8');
        End;
    14: Begin
         AFaeh:=81;
         Form1.ListView2.Items[23].SubItems[2]:=('Richtungssinn +12');
        End;
    15: Begin
         AFaeh:=86;
         Form1.ListView2.Items[23].SubItems[2]:=('Robustheit +9');
        End;
    16: Begin
         AFaeh:=91;
         Form1.ListView2.Items[23].SubItems[2]:=('Wachgabe +6');
        End;
    17: Begin
         AFaeh:=96;
         Form1.ListView2.Items[23].SubItems[2]:=('Einpr�gen +4');
        End;
   End;
 End;
 Form2.Visible:=False;
 Form3.Show;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form1.Close;
end;

end.
