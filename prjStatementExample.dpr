program prjStatementExample;

uses
  Forms,
  Example in 'Example.pas' {frmExample},
  Linkhub in 'Linkhub/Linkhub.pas',
  Popbill in 'Popbill/Popbill.pas',
  PopbillStatement in 'PopbillStatement/PopbillStatement.pas';
  
{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmExample, frmExample);
  Application.Run;
end.
