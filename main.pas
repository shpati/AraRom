unit main;

interface

uses
  Windows, StdCtrls, Controls, Classes, SysUtils, Forms;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    procedure validate_arab(Sender: TObject; var Key: Char);
    procedure validate_roman(Sender: TObject; var Key: Char);
    procedure convert_to_roman;
    procedure convert_to_arab;
    procedure c_arab(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure c_roman(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure autocorrect(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation

{$R *.dfm}

procedure TForm1.validate_arab(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #9, #13, #27, #127]) then key := #0;
end;

procedure TForm1.validate_roman(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
  if not (Key in ['I', 'V', 'X', 'L', 'C', 'D', 'M', #8, #9, #13, #27, #127]) then key := #0;
end;

procedure TForm1.convert_to_roman;
var
  str: string;
  num, i: integer;
begin
  str := '';
  if Edit1.Text = '' then Exit;
  num := StrToInt(Edit1.Text);
  for i := (num div 1000) downto 1 do str := str + 'M';
  num := num mod 1000;
  if (num div 900 = 1) then str := str + 'CM';
  num := num mod 900;
  for i := (num div 500) downto 1 do str := str + 'D';
  num := num mod 500;
  if (num div 400 = 1) then str := str + 'CD';
  num := num mod 400;
  for i := (num div 100) downto 1 do str := str + 'C';
  num := num mod 100;
  if (num div 90 = 1) then str := str + 'XC';
  num := num mod 90;
  for i := (num div 50) downto 1 do str := str + 'L';
  num := num mod 50;
  if (num div 40 = 1) then str := str + 'XL';
  num := num mod 40;
  for i := (num div 10) downto 1 do str := str + 'X';
  num := num mod 10;
  if (num div 9 = 1) then str := str + 'IX';
  num := num mod 9;
  for i := (num div 5) downto 1 do str := str + 'V';
  num := num mod 5;
  if (num div 4 = 1) then str := str + 'IV';
  num := num mod 4;
  for i := num downto 1 do str := str + 'I';
  if Edit2.Text <> str then
  begin
    Edit2.Text := str;
    Edit2.SelStart := Length(Edit2.Text);
  end;
end;

procedure TForm1.convert_to_arab;
var
  str: string;
  i, num: integer;
begin
  str := ' ' + Edit2.Text + ' ';
  num := 0;
  for i := Length(str) downto 1 do
  begin
    if (str[i] = 'I') and (str[i + 1] <> 'V') and (str[i + 1] <> 'X') then num := num + 1;
    if (str[i] = 'V') and (str[i - 1] = 'I') then num := num + 4;
    if (str[i] = 'X') and (str[i - 1] = 'I') then num := num + 9;
    if (str[i] = 'V') and (str[i - 1] <> 'I') then num := num + 5;

    if (str[i] = 'X') and (str[i + 1] <> 'L') and (str[i + 1] <> 'C') and (str[i - 1] <> 'I') then num := num + 10;
    if (str[i] = 'L') and (str[i - 1] = 'X') then num := num + 40;
    if (str[i] = 'C') and (str[i - 1] = 'X') then num := num + 90;
    if (str[i] = 'L') and (str[i - 1] <> 'X') then num := num + 50;

    if (str[i] = 'C') and (str[i + 1] <> 'D') and (str[i + 1] <> 'M') then num := num + 100;
    if (str[i] = 'D') and (str[i - 1] = 'C') then num := num + 400;
    if (str[i] = 'M') and (str[i - 1] = 'C') then num := num + 900;
    if (str[i] = 'D') and (str[i - 1] <> 'C') then num := num + 500;

    if (str[i] = 'M') and (str[i - 1] <> 'D') and (str[i - 1] <> 'C') then num := num + 1000;
  end;
  if num > 0 then Edit1.Text := inttostr(num) else Edit1.Text := '';
end;

procedure TForm1.c_arab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  convert_to_arab;
  Label3.Caption := '<<';
  autocorrect(nil);
end;

procedure TForm1.c_roman(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  convert_to_roman;
  Label3.Caption := '>>';
end;

procedure TForm1.autocorrect(Sender: TObject);
var
  temp: string;
begin
  temp := Edit2.Text;
  convert_to_arab;
  convert_to_roman;
  if not CheckBox1.Checked and (Edit2.Text <> temp) then
  begin
    Edit2.text := temp;
    Edit2.SelStart := Length(Edit2.Text);
    Edit1.Text := 'Incorrect Roman number';
  end;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  CheckBox1.Checked := not CheckBox1.Checked;
end;

end.

