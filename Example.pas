unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillStatement, ExtCtrls;

const
        //��ũ���̵�.
        LinkID = 'TESTER';
        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

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
    GroupBox7: TGroupBox;
    btnGetPopUpURL: TButton;
    btnGetPrintURL: TButton;
    btnGetPrintsURL: TButton;
    btnGetMailURL: TButton;
    txtCorpNum: TEdit;
    Label3: TLabel;
    GroupBox4: TGroupBox;
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
    Button1: TButton;
    btnCheckID: TButton;
    btnCheckIsMember: TButton;
    btnGetPartnerBalance: TButton;
    btnRegistContact: TButton;
    btnListContact: TButton;
    btnUpdateContact: TButton;
    GroupBox14: TGroupBox;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    GroupBox15: TGroupBox;
    btnRegistIssue: TButton;
    btnCancel: TButton;
    btnDelete_registIssue: TButton;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    btnGetPopbillURL_CHRG: TButton;
    btnIssueFax: TButton;
    btnSearch: TButton;
    btnAttachStatement: TButton;
    btnDetachStatement: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
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
    procedure Button1Click(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnRegistIssueClick(Sender: TObject);
    procedure btnGetPopbillURL_CHRGClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDelete_registIssueClick(Sender: TObject);
    procedure btnIssueFaxClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAttachStatementClick(Sender: TObject);
    procedure btnDetachStatementClick(Sender: TObject);
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

        //����ȯ�� ������, true(�׽�Ʈ��), false(�����)
        statementService.IsTest := true;

        //Exception ó�� ������, true(�⺻��)
        statementService.IsThrowException := false;

end;

procedure TfrmExample.FormClose(Sender:TObject; var Action:TCloseAction);
begin
        statementService.Free;
        Action := caFree;
end;

function IfThen(condition :bool; trueVal :String ; falseVal : String) : string;
begin
    if condition then result := trueVal else result := falseVal;
end;

procedure TfrmExample.btnGetPopBillURLClick(Sender: TObject);
var
  resultURL : String;
begin

        try
                resultURL := statementService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'LOGIN');
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
        joinInfo.LinkID := LinkID;        //��ũ���̵�
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
        
        statement.writeDate := '20160126';             //�ʼ�, ����� �ۼ�����
        statement.purposeType := '����';               //�ʼ�, {����, û��}
        statement.taxType :='����';                    //�ʼ�, {����, ����, �鼼}
        statement.SMSSendYN := false;                   //����� ���ڹ߼۱�� ���� Ȱ��
        statement.AutoAcceptYN := false;                //������ ���ξ��� ����ÿ� ���� ó������.
        statement.MgtKey := tbMgtKey.Text;

        statement.senderCorpNum := '1234567890';        //������ ����ڹ�ȣ
        statement.senderTaxRegID := '';                 //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderCorpName := '������ ��ȣ';
        statement.senderCEOName := '������"" ��ǥ�� ����';
        statement.senderAddr := '������ �ּ�';
        statement.senderBizClass := '������ ����';
        statement.senderBizType := '������ ����,����2';
        statement.senderContactName := '������ ����ڸ�';
        statement.senderEmail := 'test@test.com';
        statement.senderTEL := '070-7070-0707';
        statement.senderHP := '010-000-2222';

        statement.receiverCorpNum := '8888888888';       // ���޹޴��� ����ڹ�ȣ
        statement.receiverCorpName := '���޹޴��� ��ȣ';
        statement.receiverTaxRegID := '';               //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.receiverCEOName := '���޹޴��� ��ǥ�� ����';
        statement.receiverAddr := '���޹޴��� �ּ�';
        statement.receiverBizClass := '���޹޴��� ����';
        statement.receiverBizType := '���޹޴��� ����';
        statement.receiverContactName := '���޹޴��� ����ڸ�';
        statement.receiverEmail := 'test@receiver.com';

        statement.supplyCostTotal := '100000';         //�ʼ� ���ް��� �հ�
        statement.taxTotal := '10000';                 //�ʼ� ���� �հ�
        statement.totalAmount := '110000';             //�ʼ� �հ�ݾ�.  ���ް��� + ����

        statement.serialNum := '123';                  //����� �Ϸù�ȣ
        statement.remark1 := '���1';
        statement.remark2 := '���2';
        statement.remark3 := '���3';

        statement.businessLicenseYN := false; //����ڵ���� �̹��� ÷�ν� ����.
        statement.bankBookYN := false ;        //����纻 �̹��� ÷�ν� ����.


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
        statement.detailList[0]._unit := '';                   //����
        statement.detailList[0].spare1 := '';
        statement.detailList[0].spare2 := '';
        statement.detailList[0].spare3 := '';
        statement.detailList[0].spare4 := '';
        statement.detailList[0].spare5 := '';        


        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;
        statement.detailList[1].itemName := 'ǰ��"��';

        //�߰��Ӽ��׸�, �ڼ��� ������ [���ڸ��� api �����Ŵ��� > 5.2. �⺻��� �߰��Ӽ� ���̺�] ����
        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';
        statement.propertyBag[0].value := '10000';

         statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';
        statement.propertyBag[2].value := '10000';


        try
                response := statementService.Register(txtCorpNum.text, statement,txtUserID.Text);
                statement.Free;
        except
                on le : EPopbillException do begin
                        statement.Free;
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
            tbFileIndexID.text := fileList[i].AttachedFile;
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

        tmp := 'ItemKey | InvoiceNum | StateCode | TaxType | WriteDate | RegDT | OpenYN | OpenDT | SenderPrintYN | ReceiverPrintYN' + #13;

        tmp := tmp + statementInfo.ItemKey + ' | ' + statementInfo.InvoiceNum + ' | ' + IntToStr(statementInfo.StateCode) + ' | '
        + statementInfo.TaxType + ' | ' + statementInfo.WriteDate + ' | ' + statementInfo.RegDT + ' | '
        + BoolToStr(statementInfo.OpenYN) + ' | ' + statementInfo.OpenDT + ' | ' + BoolToStr(statementInfo.SenderPrintYN) + ' | ' 
        + BoolToStr(statementInfo.ReceiverPrintYN) + #13;

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
        KeyList[1] := '20160112-01';
        try
                InfoList := statementService.getInfos(txtCorpNum.text,ItemCode,KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | StateCode | TaxType | WriteDate | RegDT | SenderPrintYN | ReceiverPrintYN' + #13;
        
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].ItemKey + ' | ' + IntToStr(InfoList[i].StateCode) + ' | '
                + InfoList[i].TaxType + ' | ' + InfoList[i].WriteDate + ' | ' + InfoList[i].RegDT + ' | '
                + BoolToStr(InfoList[i].senderPrintYN) + ' | ' + BoolToStr(InfoList[i].receiverPrintYN) +  #13;
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
        memo : String;
begin
        memo := '������� �޸�';
        try
                response := statementService.Cancel(txtCorpNum.text,ItemCode,tbMgtKey.Text,memo,txtUserID.Text);
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
        memo : String;
begin
        memo := '���� �޸�';
        
        try
                response := statementService.Issue(txtCorpNum.text,ItemCode,tbMgtKey.Text,memo,txtUserID.Text);
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
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        sendNum := '010-1234-1234';      // �߽Ź�ȣ
        receivenUm := '010-123-123';     // ���Ź�ȣ
        contents := '���ݰ�꼭�� ����Ǿ����ϴ�. ���� Ȯ�� �ٶ��ϴ�.';       // �ȳ����� ����, 90byte �ʰ��ϴ� ��� ���̰� �����Ǿ� ���۵�.
        
        try
                response := statementService.SendSMS(txtCorpNum.text,ItemCode,tbMgtKey.Text,sendNum,receiveNum,contents,txtUserID.Text);
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
        email : String;
begin
        email := 'test@test.com';       // ���� �����ּ�
        
        try
                response := statementService.SendEmail(txtCorpNum.text,ItemCode,tbMgtKey.Text,email,txtUserID.Text);
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
        sendNum : String;
        receiveNum : String;
begin
        sendNum := '080-1234-1234';      // �ѽ� �߽Ź�ȣ
        receiveNum := '02-111-222';     // �ѽ� ���Ź�ȣ

        try
                response := statementService.SendFAX(txtCorpNum.text,ItemCode,tbMgtKey.Text,sendNum,receiveNum,txtUserID.Text);
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
        
        statement.writeDate := '20150610';             //�ʼ�, ����� �ۼ�����
        statement.purposeType := '����';               //�ʼ�, {����, û��}
        statement.taxType :='����';                    //�ʼ�, {����, ����, �鼼}
        statement.SMSSendYN := true;                   //����� ���ڹ߼۱�� ���� Ȱ��
        statement.AutoAcceptYN := true;                //������ ���ξ��� ����ÿ� ���� ó������.
        statement.MgtKey := tbMgtKey.Text;

        statement.senderCorpNum := '1234567890';
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


        //�߰��Ӽ��׸�, �ڼ��� ������ [���ڸ��� api �����Ŵ��� > 5.2. �⺻��� �߰��Ӽ� ���̺�] ����
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
                statement.Free;
        except
                on le : EPopbillException do begin
                        statement.Free;
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


procedure TfrmExample.Button1Click(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := statementService.getEPrintURL(txtCorpNum.Text,ItemCode,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := statementService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        joinInfo.id := 'userid';                        // [�ʼ�] ���̵� (6�� �̻� 20�� �̸�)
        joinInfo.pwd := 'thisispassword';               // [�ʼ�] ��й�ȣ (6�� �̻� 20�� �̸�)
        joinInfo.personName := '����ڼ���';            // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 30�� �̳�)
        joinInfo.tel := '070-7510-3710';                // [�ʼ�] ����ó
        joinInfo.hp := '010-1111-2222';                 // �޴�����ȣ
        joinInfo.fax := '02-6442-9700';                 // �ѽ���ȣ
        joinInfo.email := 'test@test.com';              // [�ʼ�] �̸���
        joinInfo.searchAllAllowYN := false;             // ��ȸ����(true ȸ����ȸ/ false ������ȸ)
        joinInfo.mgrYN     := false;                    // ������ ���ѿ��� 

        try
                response := statementService.RegistContact(txtCorpNum.text,joinInfo,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin

        try
                InfoList := statementService.ListContact(txtCorpNum.text,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        tmp := 'id | email | hp | personName | searchAllAlloyYN | tel | fax | mgrYN | regDT' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].searchAllAllowYN) + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        contactInfo := TContactInfo.Create;

        contactInfo.personName := '�׽�Ʈ �����';      // ����ڸ�
        contactInfo.tel := '070-7510-3710';             // ����ó
        contactInfo.hp := '010-4324-1111';              // �޴�����ȣ
        contactInfo.email := 'test@test.com';           // �̸��� �ּ�
        contactInfo.fax := '02-6442-9799';              // �ѽ���ȣ
        contactInfo.searchAllAllowYN := true;           // ȸ����ȸ ���ѿ���
        contactInfo.mgrYN := false;                     // ������ ��ȯ ���� 

        try
                response := statementService.UpdateContact(txtCorpNum.text,contactInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        try
                corpInfo := statementService.GetCorpInfo(txtCorpNum.text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr : ' + corpInfo.Addr + #13;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        corpInfo := TCorpInfo.Create;

        corpInfo.ceoname := '��ǥ�ڸ�';         //��ǥ�ڸ�
        corpInfo.corpName := '�˺�';            // ȸ���
        corpInfo.bizType := '����';             // ����
        corpInfo.bizClass := '����';            // ����
        corpInfo.addr := '����Ư���� ������ ������� 517';  // �ּ�

        try
                response := statementService.UpdateCorpInfo(txtCorpNum.text,corpInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnRegistIssueClick(Sender: TObject);
var
        statement : TStatement;
        response : TResponse;
        memo : String;
begin
        statement := TStatement.Create;
        statement.itemCode := ItemCode;
        statement.formCode := txtFormCode.Text;
        
        statement.writeDate := '20160126';             //�ʼ�, ����� �ۼ�����
        statement.purposeType := '����';               //�ʼ�, {����, û��}
        statement.taxType :='����';                    //�ʼ�, {����, ����, �鼼}
        statement.SMSSendYN := false;                  //����� ���ڹ߼۱�� ���� Ȱ��
        statement.AutoAcceptYN := true;               //������ ���ξ��� ����ÿ� ���� ó������.
        statement.MgtKey := tbMgtKey.Text;

        statement.senderCorpNum := '1234567890';       //������ ����ڹ�ȣ
        statement.senderTaxRegID := '';                //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderCorpName := '������ ��ȣ';
        statement.senderCEOName := '������ ��ǥ�� ����';
        statement.senderAddr := '������ �ּ�';
        statement.senderBizClass := '������ ����';
        statement.senderBizType := '������ ����,����2';
        statement.senderContactName := '������ ����ڸ�';
        statement.senderEmail := 'test@test.com';
        statement.senderTEL := '070-7070-0707';
        statement.senderHP := '010-000-2222';

        statement.receiverCorpNum := '8888888888';    // ���޹޴��� ����ڹ�ȣ
        statement.receiverCorpName := '���޹޴��� ��ȣ';
        statement.receiverTaxRegID := '';             //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.receiverCEOName := '���޹޴��� ��ǥ�� ����';
        statement.receiverAddr := '���޹޴��� �ּ�';
        statement.receiverBizClass := '���޹޴��� ����';
        statement.receiverBizType := '���޹޴��� ����';
        statement.receiverContactName := '���޹޴��� ����ڸ�';
        statement.receiverEmail := 'test@receiver.com';
        statement.receiverTEL := '070-1234-1234';
        statement.receiverHP := '010-111-222';

        statement.supplyCostTotal := '100000';         //�ʼ� ���ް��� �հ�
        statement.taxTotal := '10000';                 //�ʼ� ���� �հ�
        statement.totalAmount := '110000';             //�ʼ� �հ�ݾ�.  ���ް��� + ����

        statement.serialNum := '123';                  // ���� �� �Ϸù�ȣ
        statement.remark1 := '���1';
        statement.remark2 := '���2';
        statement.remark3 := '���3';

        statement.businessLicenseYN := false; //����ڵ���� �̹��� ÷�ν� ����.
        statement.bankBookYN := false ;        //����纻 �̹��� ÷�ν� ����.

        //���׸� 0~99�� ���� �ۼ�����.
        // SerialNum �� 1���� 99���� ��������.
        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        statement.detailList[0].purchaseDT := '20151211';      //�ŷ�����
        statement.detailList[0].itemName := 'ǰ���';
        statement.detailList[0].spec := '�԰�';
        statement.detailList[0].qty := '1';                    //����
        statement.detailList[0].unitCost := '100000';          //�ܰ�
        statement.detailList[0].supplyCost := '100000';        //���ް���
        statement.detailList[0].tax := '10000';                //����
        statement.detailList[0].remark := 'ǰ����';
        statement.detailList[0]._unit := '';                   //����
        statement.detailList[0].spare1 := '';
        statement.detailList[0].spare2 := '';
        statement.detailList[0].spare3 := '';
        statement.detailList[0].spare4 := '';
        statement.detailList[0].spare5 := '';
        
        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;
        statement.detailList[1].itemName := 'ǰ���';

        //�߰��Ӽ��׸�, �ڼ��� ������ [���ڸ��� api �����Ŵ��� > 5.2. �⺻��� �߰��Ӽ� ���̺�] ����
        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';
        statement.propertyBag[0].value := '10000';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';
        statement.propertyBag[2].value := '10000';

        try
                memo := '��ù��� �޸�';
                response := statementService.RegistIssue(txtCorpNum.text, statement,memo,txtUserID.Text);
                statement.Free;
        except
                on le : EPopbillException do begin
                        statement.Free;
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin

        try
                resultURL := statementService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := statementService.CheckIsMember(txtCorpNum.text,LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnCancelClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        memo := '������� �޸�';
        
        try
                response := statementService.Cancel(txtCorpNum.text,ItemCode,tbMgtKey.Text,memo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnDelete_registIssueClick(Sender: TObject);
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

procedure TfrmExample.btnIssueFaxClick(Sender: TObject);
var
        statement : TStatement;
        response : String;
        sendNum : String;
        receiveNum : String;
begin
        statement := TStatement.Create;
        statement.itemCode := ItemCode;
        statement.formCode := txtFormCode.Text;
        
        statement.writeDate := '20150923';             //�ʼ�, ����� �ۼ�����
        statement.purposeType := '����';               //�ʼ�, {����, û��}
        statement.taxType :='����';                    //�ʼ�, {����, ����, �鼼}
        statement.SMSSendYN := false;                  //����� ���ڹ߼۱�� ���� Ȱ��
        statement.AutoAcceptYN := false;               //������ ���ξ��� ����ÿ� ���� ó������.
        statement.MgtKey := tbMgtKey.Text;             //�ѽ����ϸ�

        statement.senderCorpNum := '1234567890';
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
        statement.receiverFAX :='010-2222-1111';

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
        statement.propertyBag[2].name := 'Deposit';
        statement.propertyBag[2].value := '10000';


        try
                sendNum := '07075103710';
                receiveNum := '02111222';
                response := statementService.FAXSend(txtCorpNum.text, statement,sendNum, receiveNum,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('receiptNum : '+ response);

end;

procedure TfrmExample.btnSearchClick(Sender: TObject);
var
        DType : String;
        SDate : String;
        EDate : String;
        StateList : Array Of String;
        ItemCodeList : Array Of Integer;
        Page : Integer;
        PerPage : Integer;
        Order : String;
        tmp : String;
        i : integer;
        SearchList : TStatementSearchList;
begin

        DType := 'R';                   // [�ʼ�] �������� { R: �������, W:�ۼ�����, I:�������� }
        SDate := '20160101';            // [�ʼ�] �˻� ��������, �ۼ�����(yyyyMMdd)
        EDate := '20160112';            // [�ʼ�] �˻� ��������, �ۼ�����(yyyyMMdd)

        SetLength(StateList, 3);        // ���ۻ��°� �迭. �̱���� ��ü��ȸ, �������� �� 3�ڸ��� �迭, 2,3��° �ڸ� ���ϵ� ī�� ��밡��
        StateList[0] := '1**';
        StateList[1] := '2**';
        StateList[2] := '3**';

        SetLength(ItemCodeList, 6);     // �������� �ڵ�迭
        ItemCodeList[0] := 121;         // �ŷ�����
        ItemCodeList[1] := 122;         // û����
        ItemCodeList[2] := 123;         // ������
        ItemCodeList[3] := 124;         // ���ּ�
        ItemCodeList[4] := 125;         // �Ա�ǥ
        ItemCodeList[5] := 126;         // ������

        Page := 1;                      // ������ ��ȣ, �⺻�� 1
        PerPage := 30;                  // �������� �˻�����, �⺻�� 500, �ִ� 1000

        Order := 'D';                   // 'D' : �������� , 'A' : ��������

        try
                SearchList := statementService.Search(txtCorpNum.text,DType, SDate, EDate, StateList, ItemCodeList, Page, PerPage,Order);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'code : '+IntToStr(SearchList.code) + #13;
        tmp := tmp + 'total : '+ IntToStr(SearchList.total) + #13;
        tmp := tmp + 'perPage : '+ IntToStr(SearchList.perPage) + #13;
        tmp := tmp + 'pageNum : '+ IntToStr(SearchList.pageNum) + #13;
        tmp := tmp + 'pageCount : '+ IntToStr(SearchList.pageCount) + #13;
        tmp := tmp + 'message : '+ SearchList.message + #13#13;

        tmp := tmp + 'ItemCode | ItemKey | StateCode | TaxType | WriteDate | SenderCorpName | SenderCorpNum | '
               + ' ReceiverCorpName | ReceiverCorpNum | SupplyCostTotal | TaxTotal | RegDT | SenderPrintYN | ReceiverPrintYN ' + #13;
        
        for i := 0 to Length(SearchList.list) -1 do
        begin
            tmp := tmp + IntToStr(SearchList.list[i].ItemCode) + ' | '          // �������� �ڵ�
                + SearchList.list[i].ItemKey + ' | '                            // �������ڵ�
                + IntToStr(SearchList.list[i].StateCode) + ' | '                // �����ڵ�
                + SearchList.list[i].TaxType + ' | '                            // ��������
                + SearchList.list[i].WriteDate + ' | '                          // �ۼ�����
                + SearchList.list[i].SenderCorpName + ' | '                     // �߽��� ��ȣ
                + SearchList.list[i].SenderCorpNum + ' | '                      // �߽��� ����ڹ�ȣ
                + SearchList.list[i].ReceiverCorpName + ' | '                   // ������ ��ȣ
                + SearchList.list[i].ReceiverCorpNum + ' | '                    // ������ ����ڹ�ȣ
                + SearchList.list[i].SupplyCostTotal + ' | '                    // ���ް��� �հ�
                + SearchList.list[i].TaxTotal + ' | '                           // ���� �հ�
                + SearchList.list[i].RegDT + ' | '                              // �ӽ����� �Ͻ� (yyyyMMddHHmmss)
                + BoolToStr(SearchList.list[i].SenderPrintYN) + ' | '           // �߽��� �μ⿩��
                + BoolToStr(SearchList.list[i].receiverPrintYN) + ' | ' + #13;   // ������ �μ⿩��
        end;

        SearchList.Free;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnAttachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        SubItemCode := 121;             // ÷���� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubMgtKey := '20151223-01';     // ÷���� ���ڸ��� ����������ȣ

        try
                response := statementService.AttachStatement(txtCorpNum.text,ItemCode,tbMgtKey.Text,SubItemCode,SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);


end;

procedure TfrmExample.btnDetachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        SubItemCode := 121;             // ÷�������� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubMgtKey := '20151223-01';     // ÷�������� ���ڸ��� ����������ȣ

        try
                response := statementService.DetachStatement(txtCorpNum.text,ItemCode,tbMgtKey.Text,SubItemCode,SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);


end;

end.
