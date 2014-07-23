unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillStatement, ExtCtrls;

const
        //�������̵�.
        LinkID = 'TESTER';
        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
        SecretKey = 'gUxhRqBDh7uz0qByAL7ZexcVT8FXdaFFeuGxRAHgCq8=';

type
  TfrmExample = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Shape11: TShape;
    Shape2: TShape;
    Shape9: TShape;
    Shape1: TShape;
    Label6: TLabel;
    btnRegister: TButton;
    btnUpdate: TButton;
    btnCancel_Issue: TButton;
    btnDelete: TButton;
    btnIssue: TButton;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    btnGetFileList: TButton;
    btnAttachFile: TButton;
    btnDeleteFile: TButton;
    tbFileIndexID: TEdit;
    GroupBox5: TGroupBox;
    btnGetDetailInfo: TButton;
    btnGetLogs: TButton;
    btnGetInfo: TButton;
    btnGetInfos: TButton;
    GroupBox6: TGroupBox;
    btnReSendEmail: TButton;
    btnReSendSMS: TButton;
    btnSendInvoiceFax: TButton;
    tbMgtKey: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoin: TButton;
    GroupBox11: TGroupBox;
    btnGetBalance: TButton;
    btnGetUnitCost: TButton;
    GroupBox12: TGroupBox;
    btnGetPopBillURL: TButton;
    cbTOGO: TComboBox;
    GroupBox7: TGroupBox;
    btnGetPopUpURL: TButton;
    btnGetPrintURL: TButton;
    btnGetPrintsURL: TButton;
    btnGetMailURL: TButton;
    txtCorpNum: TEdit;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    btnGetPartnerBalance: TButton;
    btnCheckMgtKeyInUse: TButton;
    Label4: TLabel;
    txtUserID: TEdit;
    GroupBox10: TGroupBox;
    btnGetTaxinvoiceURL1: TButton;
    btnGetTaxinvoiceURL2: TButton;
    OpenDialog1: TOpenDialog;
    cbItemCode: TComboBox;
    txtFormCode: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnGetPopBillURLClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAttachFileClick(Sender: TObject);
    procedure btnGetFileListClick(Sender: TObject);
    procedure btnDeleteFileClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure btnGetInfosClick(Sender: TObject);
    procedure btnGetLogsClick(Sender: TObject);
    procedure cbItemCodeChange(Sender: TObject);
    procedure btnCancel_IssueClick(Sender: TObject);
    procedure btnIssueClick(Sender: TObject);
    procedure btnReSendSMSClick(Sender: TObject);
    procedure btnReSendEmailClick(Sender: TObject);
    procedure btnSendInvoiceFaxClick(Sender: TObject);
    procedure btnGetTaxinvoiceURL1Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL2Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL3Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL4Click(Sender: TObject);
    procedure btnGetPopUpURLClick(Sender: TObject);
    procedure btnGetPrintURLClick(Sender: TObject);
    procedure btnGetMailURLClick(Sender: TObject);
    procedure btnGetPrintsURLClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnGetDetailInfoClick(Sender: TObject);
    procedure btnCheckMgtKeyInUseClick(Sender: TObject);
public
  end;

var
  frmExample: TfrmExample;
  statementService : TStatementService;
  ItemCode : Integer;
implementation

{$R *.DFM}

procedure TfrmExample.FormCreate(Sender: TObject);
begin
        ItemCode := 121;
        //���ڸ��� ��� �ʱ�ȭ.
        statementService := TStatementService.Create(LinkID,SecretKey);
        statementService.IsTest := true;
end;

function IfThen(condition :bool; trueVal :String ; falseVal : String) : string;
begin
    if condition then result := trueVal else result := falseVal;
end;

procedure TfrmExample.btnGetPopBillURLClick(Sender: TObject);
var
  resultURL : String;
  TOGO : String;
begin
        TOGO := cbTOGO.Text;

        if Pos(' : ',TOGO) = 0 then begin
                ShowMessage('URL �ڵ带 �����ϼ���.');
                Exit;
        end;
        
        Delete(TOGO, Pos(' : ',TOGO), Length(TOGO) - Pos(' : ',TOGO) + 1);

        try
                resultURL := statementService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,TOGO);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;



procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        joinInfo.LinkID := LinkID; //��Ʈ�� ���̵�
        joinInfo.CorpNum := '1231212312'; //����ڹ�ȣ '-' ����.
        joinInfo.CEOName := '��ǥ�ڼ���';
        joinInfo.CorpName := '��ȣ';
        joinInfo.Addr := '�ּ�';
        joinInfo.ZipCode := '500-100';
        joinInfo.BizType := '����';
        joinInfo.BizClass := '����';
        joinInfo.ID     := 'userid';  //6�� �̻� 20�� �̸�.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6�� �̻� 20�� �̸�.
        joinInfo.ContactName := '����ڸ�';
        joinInfo.ContactTEL :='02-999-9999';
        joinInfo.ContactHP := '010-1234-5678';
        joinInfo.ContactFAX := '02-999-9998';
        joinInfo.ContactEmail := 'test@test.com';

        try
                response := statementService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnRegisterClick(Sender: TObject);
var
        statement : TStatement;
        response : TResponse;
begin
        statement := TStatement.Create;
        statement.itemCode := ItemCode;
        statement.formCode := txtFormCode.Text;
        
        statement.writeDate := '20140319';             //�ʼ�, ����� �ۼ�����
        statement.purposeType := '����';               //�ʼ�, {����, û��}
        statement.taxType :='����';                    //�ʼ�, {����, ����, �鼼}
        statement.SMSSendYN := false;                   //����� ���ڹ߼۱�� ���� Ȱ��
        statement.AutoAcceptYN := false;                //������ ���ξ��� ����ÿ� ���� ó������.
        statement.MgtKey := tbMgtKey.Text;

        statement.senderCorpNum := '1231212312';
        statement.senderTaxRegID := ''; //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderCorpName := '������ ��ȣ';
        statement.senderCEOName := '������"" ��ǥ�� ����';
        statement.senderAddr := '������ �ּ�';
        statement.senderBizClass := '������ ����';
        statement.senderBizType := '������ ����,����2';
        statement.senderContactName := '������ ����ڸ�';
        statement.senderEmail := 'test@test.com';
        statement.senderTEL := '070-7070-0707';
        statement.senderHP := '010-000-2222';

        statement.receiverCorpNum := '8888888888';
        statement.receiverCorpName := '���޹޴��� ��ȣ';
        statement.receiverCEOName := '���޹޴��� ��ǥ�� ����';
        statement.receiverAddr := '���޹޴��� �ּ�';
        statement.receiverBizClass := '���޹޴��� ����';
        statement.receiverBizType := '���޹޴��� ����';
        statement.receiverContactName := '���޹޴��� ����ڸ�';
        statement.receiverEmail := 'test@receiver.com';

        statement.supplyCostTotal := '100000';         //�ʼ� ���ް��� �հ�
        statement.taxTotal := '10000';                 //�ʼ� ���� �հ�
        statement.totalAmount := '110000';             //�ʼ� �հ�ݾ�.  ���ް��� + ����

        statement.serialNum := '123';
        statement.remark1 := '���1';
        statement.remark2 := '���2';
        statement.remark3 := '���3';

        statement.businessLicenseYN := false; //����ڵ���� �̹��� ÷�ν� ����.
        statement.bankBookYN := false ;        //����纻 �̹��� ÷�ν� ����.
        statement.faxsendYN := false;          //����� Fax�߼۽� ����.



        //���׸� 0~99�� ���� �ۼ�����.
        // SerialNum �� 1���� 99���� ��������.
        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        statement.detailList[0].purchaseDT := '20140319';      //�ŷ�����
        statement.detailList[0].itemName := 'ǰ/\���';
        statement.detailList[0].spec := '�԰�';
        statement.detailList[0].qty := '1';                    //����
        statement.detailList[0].unitCost := '100000';          //�ܰ�
        statement.detailList[0].supplyCost := '100000';        //���ް���
        statement.detailList[0].tax := '10000';                //����
        statement.detailList[0].remark := 'ǰ����';


        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;
        statement.detailList[1].itemName := 'ǰ��"��';

        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';
        statement.propertyBag[0].value := '10000';

         statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'TestProperty';
        statement.propertyBag[2].value := '"�ѱ���"';


        try
                response := statementService.Register(txtCorpNum.text, statement,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
         try
                balance := statementService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        try
                unitcost := statementService.GetUnitCost(txtCorpNum.text,ItemCode);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(cbItemCode.Text +' ����ܰ� : '+ FloatToStr(unitcost));
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
         try
                balance := statementService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := statementService.Delete(txtCorpNum.text,ItemCode,tbMgtKey.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnAttachFileClick(Sender: TObject);
var
        filePath : string;
        response : TResponse;
begin
        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        try
                response := statementService.AttachFile(txtCorpNum.text,ItemCode,tbMgtKey.Text,filePath,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;                                                 

procedure TfrmExample.btnGetFileListClick(Sender: TObject);
var
        fileList : TAttachedFileList;
        tmp : string;
        i : Integer;
begin
        try
                filelist := statementService.GetFiles(txtCorpNum.text,ItemCode,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'SerialNum | DisplayName | AttachedFile | RegDT' + #13;
        
        for i := 0 to Length(fileList) -1 do
        begin
            tmp := tmp +  IntToStr(fileList[i].SerialNum) + ' | ' + fileList[i].DisplayName + ' | ' + fileList[i].AttachedFile + ' | ' + fileList[i].RegDT + #13;

        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnDeleteFileClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := statementService.DeleteFile(txtCorpNum.text,ItemCode,tbMgtKey.Text,tbFileIndexID.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;
Function BoolToStr(b:Boolean):String;
begin 
    if b = true then BoolToStr:='True'; 
    if b = false then BoolToStr:='False'; 
end;
procedure TfrmExample.btnGetInfoClick(Sender: TObject);
var
        statementInfo : TStatementInfo;
        tmp : string;
begin
        try
                statementInfo := statementService.getInfo(txtCorpNum.text,ItemCode,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | InvoiceNum | StateCode | TaxType | WriteDate | RegDT | OpenYN | OpenDT' + #13;

        tmp := tmp + statementInfo.ItemKey + ' | ' + statementInfo.InvoiceNum + ' | ' + IntToStr(statementInfo.StateCode) + ' | '
        + statementInfo.TaxType + ' | ' + statementInfo.WriteDate + ' | ' + statementInfo.RegDT + ' | ' + BoolToStr(statementInfo.OpenYN) + ' | ' + statementInfo.OpenDT+ #13;

        ShowMessage(tmp);


end;

procedure TfrmExample.btnGetInfosClick(Sender: TObject);
var
        KeyList : Array of String;
        InfoList : TStatementInfoList;
        tmp : string;
        i : Integer;
begin
        SetLength(KeyList,2);
        KeyList[0] := '1234';
        KeyList[1] := '123';
        try
                InfoList := statementService.getInfos(txtCorpNum.text,ItemCode,KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | StateCode | TaxType | WriteDate | RegDT' + #13;
        
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].ItemKey + ' | ' + IntToStr(InfoList[i].StateCode) + ' | '
        + InfoList[i].TaxType + ' | ' + InfoList[i].WriteDate + ' | ' + InfoList[i].RegDT + #13;
        end;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetLogsClick(Sender: TObject);
var
        LogList : TStatementLogList;
        tmp : string;
        i : Integer;
begin
        try
                LogList := statementService.getLogs(txtCorpNum.text,ItemCode,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'DocLogType | Log | ProcType | ProcCorpName | ProcMemo | RegDT | IP' + #13;
        
        for i := 0 to Length(LogList) -1 do
        begin
            tmp := tmp + IntToStr(LogList[i].DocLogType) + ' | '
                        + LogList[i].Log + ' | '
                        + LogList[i].ProcType + ' | '
                        + LogList[i].ProcCorpName + ' | '
                        + LogList[i].ProcMemo + ' | '
                        + LogList[i].RegDT + ' | '
                        + LogList[i].IP + ' | ' + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.cbItemCodeChange(Sender: TObject);
begin


        if(cbItemCode.Text = '�ŷ�����') then ItemCode := 121;
        if(cbItemCode.Text = 'û����') then ItemCode := 122;
        if(cbItemCode.Text = '������') then ItemCode := 123;
        if(cbItemCode.Text = '���ּ�') then ItemCode := 124;
        if(cbItemCode.Text = '�Ա�ǥ') then ItemCode := 125;
        if(cbItemCode.Text = '������') then ItemCode := 126;

end;


procedure TfrmExample.btnCancel_IssueClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := statementService.Cancel(txtCorpNum.text,ItemCode,tbMgtKey.Text,'������� �޸�', txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnIssueClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := statementService.Issue(txtCorpNum.text,ItemCode,tbMgtKey.Text,'���� �޸�', txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;


procedure TfrmExample.btnReSendSMSClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := statementService.SendSMS(txtCorpNum.text,ItemCode,tbMgtKey.Text,'011-1111-2222','010-2222-3333','���ڸ޽��� ����' , txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnReSendEmailClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := statementService.SendEmail(txtCorpNum.text,ItemCode,tbMgtKey.Text,'test@test.com' , txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnSendInvoiceFaxClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := statementService.SendFAX(txtCorpNum.text,ItemCode,tbMgtKey.Text,'080-1234-2222','090-4321-1234' , txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;



procedure TfrmExample.btnGetTaxinvoiceURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := statementService.GetURL(txtCorpNum.Text,txtUserID.Text,'TBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL2Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := statementService.GetURL(txtCorpNum.Text,txtUserID.Text,'SBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL3Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := statementService.GetURL(txtCorpNum.Text,txtUserID.Text,'PBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL4Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := statementService.GetURL(txtCorpNum.Text,txtUserID.Text,'WRITE');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPopUpURLClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := statementService.getPopupURL(txtCorpNum.Text,ItemCode,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintURLClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := statementService.getPrintURL(txtCorpNum.Text,ItemCode,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetMailURLClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := statementService.getMailURL(txtCorpNum.Text,ItemCode,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintsURLClick(Sender: TObject);
var
        KeyList : Array of String;
        resultURL : String;
begin
        SetLength(KeyList,2);
        KeyList[0] := '1234';
        KeyList[1] := '123';
        try
                resultURL := statementService.getMassPrintURL(txtCorpNum.text,ItemCode,KeyList,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);

end;


procedure TfrmExample.btnUpdateClick(Sender: TObject);
var
        statement : TStatement;
        response : TResponse;
begin
        statement := TStatement.Create;
        
        statement.itemCode := ItemCode;
        statement.formCode := txtFormCode.Text;
        
        statement.writeDate := '20140722';             //�ʼ�, ����� �ۼ�����
        statement.purposeType := '����';               //�ʼ�, {����, û��}
        statement.taxType :='����';                    //�ʼ�, {����, ����, �鼼}
        statement.SMSSendYN := true;                   //����� ���ڹ߼۱�� ���� Ȱ��
        statement.AutoAcceptYN := true;                //������ ���ξ��� ����ÿ� ���� ó������.
        statement.MgtKey := tbMgtKey.Text;

        statement.senderCorpNum := '1231212312';
        statement.senderTaxRegID := ''; //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderCorpName := '������ ��ȣ';
        statement.senderCEOName := '������"" ��ǥ�� ����';
        statement.senderAddr := '������ �ּ�';
        statement.senderBizClass := '������ ����';
        statement.senderBizType := '������ ����,����2';
        statement.senderContactName := '������ ����ڸ�';
        statement.senderEmail := 'test@test.com';
        statement.senderTEL := '070-7070-0707';
        statement.senderHP := '010-000-2222';

        statement.receiverCorpNum := '8888888888';
        statement.receiverCorpName := '���޹޴��� ��ȣ';
        statement.receiverCEOName := '���޹޴��� ��ǥ�� ����';
        statement.receiverAddr := '���޹޴��� �ּ�';
        statement.receiverBizClass := '���޹޴��� ����';
        statement.receiverBizType := '���޹޴��� ����';
        statement.receiverContactName := '���޹޴��� ����ڸ�';
        statement.receiverEmail := 'test@receiver.com';

        statement.supplyCostTotal := '100000';         //�ʼ� ���ް��� �հ�
        statement.taxTotal := '10000';                 //�ʼ� ���� �հ�
        statement.totalAmount := '110000';             //�ʼ� �հ�ݾ�.  ���ް��� + ����

        statement.serialNum := '123';
        statement.remark1 := '���1';
        statement.remark2 := '���2';
        statement.remark3 := '���3';

        statement.businessLicenseYN := false; //����ڵ���� �̹��� ÷�ν� ����.
        statement.bankBookYN := false ;        //����纻 �̹��� ÷�ν� ����.
        statement.faxsendYN := false;          //����� Fax�߼۽� ����.



        //���׸� 0~99�� ���� �ۼ�����.
        // SerialNum �� 1���� 99���� ��������.
        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        statement.detailList[0].purchaseDT := '20140319';      //�ŷ�����
        statement.detailList[0].itemName := 'ǰ���';
        statement.detailList[0].spec := '�԰�';
        statement.detailList[0].qty := '1';                    //����
        statement.detailList[0].unitCost := '100000';          //�ܰ�
        statement.detailList[0].supplyCost := '100000';        //���ް���
        statement.detailList[0].tax := '10000';                //����
        statement.detailList[0].remark := 'ǰ����';


        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;
        statement.detailList[1].itemName := 'ǰ��"��';

        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';
        statement.propertyBag[0].value := '10000';

         statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'TestProperty';
        statement.propertyBag[2].value := '"�ѱ�1111��"';

        try
                response := statementService.Update(txtCorpNum.text,ItemCode,tbMgtKey.Text, statement,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;


procedure TfrmExample.btnGetDetailInfoClick(Sender: TObject);
var
        statement : TStatement;
        tmp : string;
        i : integer;
begin
        try
                statement := statementService.getDetailInfo(txtCorpNum.text,ItemCode,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := tmp +'mgtKey : ' +  statement.mgtKey + #13;
        tmp := tmp +'formCode : ' +  statement.formCode + #13;
        tmp := tmp +'itemCode : ' +  IntToStr(statement.itemCode) + #13;

        tmp := tmp +'writeDate : ' +  statement.WriteDate + #13;
        tmp := tmp +'taxType : ' +  statement.TaxType + #13;
        tmp := tmp +'SMSSendYN : ' +  IfThen(statement.SMSSendYN,'true','false') + #13;
        tmp := tmp +'AutoAcceptYN : ' +  IfThen(statement.AutoAcceptYN,'true','false') + #13;

        tmp := tmp +'senderCorpNum : ' +  statement.SenderCorpNum + #13;
        tmp := tmp +'senderTaxRegID : ' +  statement.SenderTaxRegID + #13;
        tmp := tmp +'senderCorpName : ' +  statement.SenderCorpName + #13;
        tmp := tmp +'senderCEOName : ' +  statement.SenderCEOName + #13;
        tmp := tmp +'senderAddr : ' +  statement.SenderAddr + #13;
        tmp := tmp +'senderBizClass : ' +  statement.SenderBizClass + #13;
        tmp := tmp +'senderBizType : ' +  statement.SenderBizType + #13;
        tmp := tmp +'senderContactName : ' +  statement.SenderContactName + #13;
        tmp := tmp +'senderDeptName : ' +  statement.SenderDeptName + #13;
        tmp := tmp +'senderTEL : ' +  statement.SenderTEL + #13;
        tmp := tmp +'senderHP : ' +  statement.SenderHP + #13;
        tmp := tmp +'senderEmail : ' +  statement.SenderEmail + #13;

        tmp := tmp +'receiverCorpNum : ' +  statement.ReceiverCorpNum + #13;
        tmp := tmp +'receiverTaxRegID : ' +  statement.ReceiverTaxRegID + #13;
        tmp := tmp +'receiverCorpName : ' +  statement.ReceiverCorpName + #13;
        tmp := tmp +'receiverCEOName : ' +  statement.ReceiverCEOName + #13;
        tmp := tmp +'receiverAddr : ' +  statement.ReceiverAddr + #13;
        tmp := tmp +'receiverBizClass : ' +  statement.ReceiverBizClass + #13;
        tmp := tmp +'receiverBizType : ' +  statement.ReceiverBizType + #13;
        tmp := tmp +'receiverContactName : ' +  statement.ReceiverContactName + #13;
        tmp := tmp +'receiverDeptName : ' +  statement.ReceiverDeptName + #13;
        tmp := tmp +'receiverTEL : ' +  statement.ReceiverTEL + #13;
        tmp := tmp +'receiverHP : ' +  statement.ReceiverHP + #13;
        tmp := tmp +'receiverEmail : ' +  statement.ReceiverEmail + #13;

        tmp := tmp +'taxTotal : ' +  statement.taxTotal + #13;
        tmp := tmp +'supplyCostTotal : ' +  statement.supplyCostTotal + #13;
        tmp := tmp +'totalAmount : ' +  statement.totalAmount + #13;

        tmp := tmp +'purposeType : ' +  statement.purposeType + #13;
        tmp := tmp +'serialNum : ' +  statement.serialNum + #13;


        tmp := tmp +'remark1 : ' +  statement.remark1 + #13;
        tmp := tmp +'remark2 : ' +  statement.remark2 + #13;
        tmp := tmp +'remark3 : ' +  statement.remark3 + #13;

        tmp := tmp +'businessLicenseYN : ' +  IfThen(statement.businessLicenseYN,'true','false') + #13;
        tmp := tmp +'bankBookYN : ' +  IfThen(statement.bankBookYN,'true','false') + #13;
        tmp := tmp +'faxsendYN : ' +  IfThen(statement.fAXSendYN,'true','false') + #13;

        tmp := tmp + '-----���׸�-----' + #13;

        for i:= 0 to Length(statement.detailList)-1 do
        begin
            tmp := tmp + IntToStr(statement.detailList[i].serialNum) + ' | ' +
                         statement.detailList[i].purchaseDT + ' | ' +
                         statement.detailList[i].itemName + ' | ' +
                         statement.detailList[i].spec + ' | ' +
                         statement.detailList[i].qty + ' | ' +
                         statement.detailList[i].unitCost + ' | ' +
                         statement.detailList[i].supplyCost + ' | ' +
                         statement.detailList[i].tax + ' | ' +
                         statement.detailList[i].remark + ' | ' +
                         statement.detailList[i].spare1 + ' | ' +
                         statement.detailList[i].spare2 + ' | ' +
                         statement.detailList[i].spare3 + ' | ' +
                         statement.detailList[i].spare4 + ' | ' +
                         statement.detailList[i].spare5 + #13 ;

        end;

        tmp := tmp + '-----�߰��Ӽ�-----' + #13;

        for i:= 0 to Length(statement.propertyBag)-1 do
        begin
            tmp := tmp + statement.propertyBag[i].name + ' : ' +
                         statement.propertyBag[i].value + #13 ;

        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnCheckMgtKeyInUseClick(Sender: TObject);
var
        InUse : boolean;
begin
        try
                InUse := statementService.CheckMgtKeyInUse(txtCorpNum.text,ItemCode,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        if InUse then ShowMessage('�����') else ShowMessage('�� �����.');
end;


end.
