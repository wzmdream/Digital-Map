program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule},
  Unit3_cssz in 'Unit3_cssz.pas' {setting},
  Unit_bbxx in 'Unit_bbxx.pas' {bbxx},
  Unit__qycz in 'Unit__qycz.pas' {Form__qycz},
  Unit1_dl in 'Unit1_dl.pas' {Form1_dl},
  Unit3_bz in 'Unit3_bz.pas' {Form_bz},
  Unit3 in 'Unit3.pas' {JieTu_0},
  Unit4 in 'Unit4.pas' {JieTu_1},
  Unit5 in 'Unit5.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_bz, Form_bz);
  Application.CreateForm(TJieTu_0, JieTu_0);
  Application.CreateForm(TJieTu_1, JieTu_1);
  Application.CreateForm(TForm5, Form5);
  Application.ShowMainForm:=False;
  Application.CreateForm(TForm1_dl, Form1_dl);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(Tsetting, setting);
  Application.CreateForm(Tbbxx, bbxx);
  Application.CreateForm(TForm__qycz, Form__qycz);
  Form1_dl.ShowModal;
  Application.Run;
end.
