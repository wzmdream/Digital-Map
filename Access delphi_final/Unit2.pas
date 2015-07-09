unit Unit2;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule2 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOTa_class: TADOTable;
    ADOTa_area: TADOTable;
    ADOQu_QYHF: TADOQuery;
    ADOQ_jbxx: TADOQuery;
    DataSource_jbxx: TDataSource;
    ADOQ_tj: TADOQuery;
    ADOT_Unit: TADOTable;
    ADOQ_qycz: TADOQuery;
    ADOQ_dl: TADOQuery;
    DataSource_dl: TDataSource;
    ADOQ_dw: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;
implementation

uses Unit__daying, Unit__qycz, Unit_bbxx, Unit1, Unit3_cssz;

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
//     ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password='+Form1.Password+';Persist Security Info=True;User ID='+Form1.User+';Initial Catalog='+form1.Database+';Data Source='+Form1.IP;
end;

end.
