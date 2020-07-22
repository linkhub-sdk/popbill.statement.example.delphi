{******************************************************************************}
{ �˺� ���ڸ��� API Delphi SDK Example
{
{ - ������Ʈ ���� : 2020-07-22
{ - ���� ������� ����ó : 1600-8536 / 070-4304-2991
{ - ���� ������� �̸��� : code@linkhub.co.kr
{ - SDK Ʃ�丮�� : https://docs.popbill.com/statement/tutorial/delphi
{
{ <�׽�Ʈ �������� �غ����>
{ (1) 32, 35�� ���ο� ����� ��ũ���̵�(LinkID)�� ���Ű(SecretKey)��
{    ��ũ��� ���Խ� ���Ϸ� �߱޹��� ���������� ����
{ (2) �˺� ���߿� ����Ʈ(test.popbill.com)�� ����ȸ������ ����
{                                                                              
{******************************************************************************}
unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillStatement, ExtCtrls;

const
        {**********************************************************************}
        { - ��������(��ũ���̵�, ���Ű)�� ��Ʈ���� ����ȸ���� �ĺ��ϴ�        }
        {   ������ ���ǹǷ� ������� �ʵ��� �����Ͻñ� �ٶ��ϴ�              }
        { - ����� ��ȯ���Ŀ��� ���������� ������� �ʽ��ϴ�.                  }
        {**********************************************************************}
        
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
    btnSendEmail: TButton;
    btnSendSMS: TButton;
    btnSendFax: TButton;
    tbMgtKey: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoinMember: TButton;
    GroupBox11: TGroupBox;
    btnGetUnitCost: TButton;
    GroupBox12: TGroupBox;
    btnGetAccessURL: TButton;
    txtCorpNum: TEdit;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    btnCheckMgtKeyInUse: TButton;
    Label4: TLabel;
    txtUserID: TEdit;
    GroupBox10: TGroupBox;
    btnGetURL1: TButton;
    btnGetURL2: TButton;
    OpenDialog1: TOpenDialog;
    cbItemCode: TComboBox;
    txtFormCode: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    btnCheckID: TButton;
    btnCheckIsMember: TButton;
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
    btnFaxSend: TButton;
    btnSearch: TButton;
    btnAttachStatement: TButton;
    btnDetachStatement: TButton;
    btnGetChargeInfo: TButton;
    btnGetSealURL: TButton;
    GroupBox13: TGroupBox;
    GroupBox16: TGroupBox;
    btnGetBalance: TButton;
    btnGetChargeURL: TButton;
    btnGetPartnerBalance: TButton;
    btnGetPartnerURL_CHRG: TButton;
    GroupBox7: TGroupBox;
    btnGetPopUpURL: TButton;
    btnGetPrintURL: TButton;
    btnGetPrintsURL: TButton;
    btnGetMailURL: TButton;
    Button1: TButton;
    btnListEmailConfig: TButton;
    btnUpdateEmailConfig: TButton;
    btnGetPDFURL: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
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
    procedure btnSendSMSClick(Sender: TObject);
    procedure btnSendEmailClick(Sender: TObject);
    procedure btnSendFaxClick(Sender: TObject);
    procedure btnGetURL1Click(Sender: TObject);
    procedure btnGetURL2Click(Sender: TObject);
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
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDelete_registIssueClick(Sender: TObject);
    procedure btnFaxSendClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAttachStatementClick(Sender: TObject);
    procedure btnDetachStatementClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnGetSealURLClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnListEmailConfigClick(Sender: TObject);
    procedure btnUpdateEmailConfigClick(Sender: TObject);
    procedure btnGetPDFURLClick(Sender: TObject);
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

        //����ȯ�� ������, true(���߿�), false(�����)
        statementService.IsTest := true;

        //Exception ó�� ������, true(�⺻��)
        statementService.IsThrowException := true;

        //������ū IP���ѱ�� ��뿩��, true(����)
        statementService.IPRestrictOnOff := true;

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

Function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { �˺�(www.popbill.com)�� �α��ε� �˾� URL�� ��ȯ�մϴ�.           
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetAccessURL
        {**********************************************************************}
        try
                resultURL := statementService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL : ' + #13 + resultURL);
end;

procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { ��Ʈ���� ����ȸ������ ȸ�������� ��û�մϴ�.                      
        { - ���̵� �ߺ�Ȯ���� btnCheckIDClick ���ν����� �����Ͻñ� �ٶ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#JoinMember 
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ '-' ����, 10�ڸ�
        joinInfo.CorpNum := '4364364364';

        // ��ǥ�ڼ���, �ִ� 100��
        joinInfo.CEOName := '��ǥ�ڼ���';

        // ��ȣ��, �ִ� 200��
        joinInfo.CorpName := '��ũ���';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 100��
        joinInfo.BizType := '����';

        // ����, �ִ� 100��
        joinInfo.BizClass := '����';

        // ���̵�, 6���̻� 50�� �̸�
        joinInfo.ID     := 'userid';

        // ��й�ȣ, 6���̻� 20�� �̸�
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // ����ڸ�, �ִ� 100��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� �޴�����ȣ, �ִ� 20��
        joinInfo.ContactHP := '010-000-1111';

        // ����� �ѽ���ȣ, �ִ� 20��
        joinInfo.ContactFAX := '02-6442-9700';

        // ����� ����, �ִ� 100��
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := statementService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnRegisterClick(Sender: TObject);
var
        statement : TStatement;
        response : TResponse;
begin
        statement := TStatement.Create;
        {**********************************************************************}
        { ���ڸ��� 1���� [�ӽ�����] �մϴ�.
        { - ���ڸ��� �ӽ�����(Register API) ȣ���Ŀ��� ����(Issue API)��
        {   ȣ���ؾ߸� �����ڿ��� ������ ���۵˴ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#Register
        {**********************************************************************}

         // ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û����, 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        statement.itemCode := ItemCode;

        // �������ڵ�, �⺻��(����ó��)
        // ������ ������� �����ϰ��� �ϴ°�� ��Ʈ�ʼ���(1600-8536)�� �����ֽñ� �ٶ��ϴ�.
        statement.formCode := txtFormCode.Text;

        // [�ʼ�] �ۼ�����, �ۼ���� yyyyMMdd
        statement.writeDate := '20190319';

        // [�ʼ�] {����, û��} �� ����
        statement.purposeType := '����';

        // [�ʼ�] {����, ����, �鼼} �� ����
        statement.taxType :='����';

        // ����� ������ �˸����� ���ۿ���
        statement.SMSSendYN := false;

         // ����� �ڵ����� ���� (�������� ���ο��ο� ������� ����)
        statement.AutoAcceptYN := false;

        // ���ڸ��� ����������ȣ, 1~24�ڸ�, ����, ����, '-', '_' �������� ����
        // ����ں��� �ߺ����� �ʵ��� ����
        statement.MgtKey := tbMgtKey.Text;

        {**********************************************************************}
        {                             �߽��� ����                              }
        {**********************************************************************}

        // �߽��� ����ڹ�ȣ, '-'���� 10�ڸ�
        statement.senderCorpNum := txtCorpNum.Text;

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderTaxRegID := '';

        // �߽��� ��ȣ
        statement.senderCorpName := '�߽��� ��ȣ';

        // �߽��� ��ǥ�� ����
        statement.senderCEOName := '�߽��� ��ǥ�� ����';

        // �߽��� �ּ�
        statement.senderAddr := '�߽��� �ּ�';

        // �߽��� ����
        statement.senderBizClass := '�߽��� ����';

        // �߽��� ����
        statement.senderBizType := '�߽��� ����,����2';

        // �߽��� ����ڸ�
        statement.senderContactName := '�߽��� ����ڸ�';

        // �߽��� ����� �����ּ�
        statement.senderEmail := 'test@test.com';

        // �߽��� ����� ����ó
        statement.senderTEL := '070-7070-0707';

        // �߽��� ����� �޴�����ȣ
        statement.senderHP := '010-000-2222';

        // �߽��� ����� �ѽ�
        statement.senderFAX := '070-000-111';

        {**********************************************************************}
        {                            ������ ����                               }
        {**********************************************************************}

        // ������ ����ڹ�ȣ, '-' ���� 10�ڸ�
        statement.receiverCorpNum := '8888888888';

        // ������ ��ȣ
        statement.receiverCorpName := '������ ��ȣ';

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.receiverTaxRegID := '';

        // ������ ��ǥ�� ����
        statement.receiverCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        statement.receiverAddr := '������ �ּ�';

        // ������ ����
        statement.receiverBizClass := '������ ����';

        // ������ ����
        statement.receiverBizType := '������ ����';

        // ������ ����ڸ�
        statement.receiverContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        statement.receiverEmail := 'test@receiver.com';

        // ������ ����� ����ó
        statement.receiverTEL := '070-1234-1234';

        // ������ ����� �޴�����ȣ
        statement.receiverHP := '010-111-222';

        // ������ ����� �ѽ�
        statement.receiverFAX := '070-000-111';


        //[�ʼ�] ���ް��� �հ�
        statement.supplyCostTotal := '200000';

        //[�ʼ�] ���� �հ�
        statement.taxTotal := '20000';

        //[�ʼ�] �հ�ݾ�. ���ް��� + ����
        statement.totalAmount := '220000';

        // ���� �� �Ϸù�ȣ
        statement.serialNum := '1';

        // ���
        statement.remark1 := '���1';
        statement.remark2 := '���2';
        statement.remark3 := '���3';

        // ����ڵ���� ÷�ο���
        statement.businessLicenseYN := false;

        // ����纻 ÷�ο���
        statement.bankBookYN := false ;

        {**********************************************************************}
        {                     ���ڸ��� ���׸�(ǰ��) ����                   }
        { �Ϸù�ȣ(serialNum)�� 1���� ���������� �����Ͻñ� �ٶ��ϴ�.          }
        {**********************************************************************}

        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        statement.detailList[0].purchaseDT := '20190114';      //�ŷ�����
        statement.detailList[0].itemName := 'ǰ���';          //ǰ���
        statement.detailList[0].spec := '�԰�';                //�԰�
        statement.detailList[0].qty := '1';                    //����
        statement.detailList[0].unitCost := '100000';          //�ܰ�
        statement.detailList[0].supplyCost := '100000';        //���ް���
        statement.detailList[0].tax := '10000';                //����
        statement.detailList[0].remark := 'ǰ����';          //���
        statement.detailList[0].spare1 := '����1';             //����1
        statement.detailList[0].spare2 := '����2';             //����2
        statement.detailList[0].spare3 := '����3';             //����3
        statement.detailList[0].spare4 := '����4';             //����4
        statement.detailList[0].spare5 := '����5';             //����5

        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        statement.detailList[1].purchaseDT := '20190114';      //�ŷ�����
        statement.detailList[1].itemName := 'ǰ���';          //ǰ���
        statement.detailList[1].spec := '�԰�';                //�԰�
        statement.detailList[1].qty := '1';                    //����
        statement.detailList[1].unitCost := '100000';          //�ܰ�
        statement.detailList[1].supplyCost := '100000';        //���ް���
        statement.detailList[1].tax := '10000';                //����
        statement.detailList[1].remark := 'ǰ����';          //���
        statement.detailList[1].spare1 := '����1';             //����1
        statement.detailList[1].spare2 := '����2';             //����2
        statement.detailList[1].spare3 := '����3';             //����3
        statement.detailList[1].spare4 := '����4';             //����4
        statement.detailList[1].spare5 := '����5';             //����5

        {**********************************************************************}
        {                           �߰��Ӽ� �׸�                              }
        { - �߰��Ӽ� �׸� ���� �ڼ��� ������ "[���ڸ��� api �����Ŵ���] >  }
        {   5.2. �⺻��� �߰��Ӽ� ���̺�" �����Ͻñ� �ٶ��ϴ�.                }
        {**********************************************************************}

        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';     //���ܾ�
        statement.propertyBag[0].value := '30000';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';    //���ݾ�
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';    //���ܾ�
        statement.propertyBag[2].value := '10000';

        try
                response := statementService.Register(txtCorpNum.text, statement);
                statement.Free;
        except
                on le : EPopbillException do begin
                        statement.Free;
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ���������� �ƴ�       
        { ��Ʈ�ʰ����� ��� ��Ʈ�� �ܿ�����Ʈ Ȯ��(GetPartnerBalance API) ���
        { �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/statement/delphi/api#GetBalance
        {**********************************************************************}

        try
                balance := statementService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { ���ڸ��� ������(ItemCode) ����ܰ��� Ȯ���մϴ�.
        { 121 - �ŷ����� / 122 - û���� / 123 - ������                       
        { 124 - ���ּ� / 125 - �Ա�ǥ / 126 - ������
        { - https://docs.popbill.com/statement/delphi/api#GetUnitCost                          
        {**********************************************************************}
        try
                unitcost := statementService.GetUnitCost(txtCorpNum.text, ItemCode);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage(cbItemCode.Text +' ����ܰ� : '+ FloatToStr(unitcost));
        end;
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ��Ʈ�ʰ����� �ƴ�
        { ���������� ��� ����ȸ�� �ܿ�����Ʈ Ȯ��(GetBalance API)��
        { �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/statement/delphi/api#GetPartnerBalance
        {**********************************************************************}
        
        try
                balance := statementService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 1���� ���ڸ����� [����]�մϴ�. ���ڸ����� ������ ��쿡��
        { ����������ȣ(mgtKey)�� ���� �� �� �ֽ��ϴ�.
        { - ���������� ���� ���� : [�ӽ�����], [�������], [�ź�]
        { - https://docs.popbill.com/statement/delphi/api#Delete
        {**********************************************************************}

        try
                response := statementService.Delete(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnAttachFileClick(Sender: TObject);
var
        filePath : string;
        response : TResponse;
begin
        {**********************************************************************}
        { ���ڸ����� ÷�������� ����մϴ�.
        { - ���ڸ����� ÷������ ����� [�ӽ�����] ���¿����� �����մϴ�.
        {   [���δ��], [����Ϸ�] ���¿����� ÷�������� ��� �� �� �����ϴ�.  
        { - ÷�������� �ִ� 5������ �߰��� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#AttachFile
        {**********************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        try
                response := statementService.AttachFile(txtCorpNum.text, ItemCode,
                                                tbMgtKey.Text, filePath);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;                                                 

procedure TfrmExample.btnGetFileListClick(Sender: TObject);
var
        fileList : TAttachedFileList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ���ڸ����� ÷�ε� ������ ����� Ȯ���մϴ�.                        
        { - �����׸� �� ���Ͼ��̵�(AttachedFile)�� ���� ����(DeleteFile API)
        {   ȣ��� �̿��� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetFiles
        {**********************************************************************}
        
        try
                filelist := statementService.GetFiles(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                tmp := 'SerialNum(÷������ �Ϸù�ȣ) | DisplayName(÷�����ϸ�) | AttachedFile(���Ͼ��̵�) | RegDT(÷���Ͻ�)' + #13;

                for i := 0 to Length(fileList) -1 do
                begin
                    tmp := tmp +  IntToStr(fileList[i].SerialNum) + ' | '
                        + fileList[i].DisplayName + ' | '
                        + fileList[i].AttachedFile + ' | '
                        + fileList[i].RegDT + #13;
                    tbFileIndexID.text := fileList[i].AttachedFile;
                end;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnDeleteFileClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ���ڸ����� ÷�ε� ������ �����մϴ�.
        { - ���Ͼ��̵�� ���ϸ�� (GetFiles API)�� �����׸��� ���Ͼ��̵�         
        {   (AttachedFile) ���� Ȯ���Ͽ� DeleteFile API ȣ��� �����Ͻø� �˴ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#DeleteFile
        {**********************************************************************}

        try
                response := statementService.DeleteFile(txtCorpNum.text, ItemCode,
                                        tbMgtKey.Text, tbFileIndexID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;



procedure TfrmExample.btnGetInfoClick(Sender: TObject);
var
        statementInfo : TStatementInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 1���� ���ڸ��� ����/��� ������ Ȯ���մϴ�.                        
        { - https://docs.popbill.com/statement/delphi/api#GetInfo
        {**********************************************************************}

        try
                statementInfo := statementService.getInfo(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
                exit;
        end
        else
        begin        
                tmp := tmp + 'itemCode(���������ڵ�) :' + IntToStr(statementInfo.itemCode) + #13;
                tmp := tmp + 'itemKey(�˺� ������ȣ) :' + statementInfo.itemKey + #13;
                tmp := tmp + 'invoiceNum(����������ȣ) :' + statementInfo.invoiceNum + #13;
                tmp := tmp + 'mgtKey(����������ȣ) :' + statementInfo.mgtKey + #13;
                tmp := tmp + 'taxType(��������) :' + statementInfo.taxType + #13;
                tmp := tmp + 'writeDate(�ۼ�����) :' + statementInfo.writeDate + #13;
                tmp := tmp + 'regDT(�ӽ������Ͻ�) :' + statementInfo.regDT + #13;
                tmp := tmp + 'senderCorpName(�߽��� ��ȣ) :' + statementInfo.senderCorpName + #13;
                tmp := tmp + 'senderCorpNum(�߽��� ����ڹ�ȣ) :' + statementInfo.senderCorpNum + #13;
                tmp := tmp + 'senderPrintYN(�߽��� �μ⿩��) :' + BoolToStr(statementInfo.senderPrintYN) + #13;
                tmp := tmp + 'receiverCorpName(������ ��ȣ) :' + statementInfo.receiverCorpName + #13;
                tmp := tmp + 'receiverCorpNum(������ ����ڹ�ȣ) :' + statementInfo.receiverCorpNum + #13;
                tmp := tmp + 'receiverPrintYN(������ �μ⿩��) :' + BoolToStr(statementInfo.receiverPrintYN) + #13;
                tmp := tmp + 'supplyCostTotal(���ް��� �հ�) :' + statementInfo.supplyCostTotal + #13;
                tmp := tmp + 'taxTotal(���� �հ�) :' + statementInfo.taxTotal + #13;
                tmp := tmp + 'purposeType(����/û��) :' + statementInfo.purposeType + #13;
                tmp := tmp + 'issueDT(�����Ͻ�) :' + statementInfo.issueDT + #13;
                tmp := tmp + 'stateCode(�����ڵ�) :' + IntToStr(statementInfo.stateCode) + #13;
                tmp := tmp + 'stateDT(���� �����Ͻ�) :' + statementInfo.stateDT + #13;
                tmp := tmp + 'stateMemo(���¸޸�) :' + statementInfo.stateMemo + #13;
                tmp := tmp + 'openYN(���� ����) :' + BoolToStr(statementInfo.openYN) + #13;
                tmp := tmp + 'openDT(���� �Ͻ�) :' + statementInfo.openDT;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnGetInfosClick(Sender: TObject);
var
        KeyList : Array of String;
        InfoList : TStatementInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { �ٷ��� ���ڸ��� ����/��� ������ Ȯ���մϴ�. (�ִ� 1000��)         
        { - https://docs.popbill.com/statement/delphi/api#GetInfos
        {**********************************************************************}

        //���ڸ��� ����������ȣ �迭 (�ִ� 1000��)
        SetLength(KeyList,4);
        KeyList[0] := '20190320-01';
        KeyList[1] := '20190320-02';
        KeyList[2] := '20190320-03';
        KeyList[3] := '20190320-04';

        try
                InfoList := statementService.getInfos(txtCorpNum.text, ItemCode, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := 'itemCode(���������ڵ�) | itemKey(�˺� ������ȣ) | invoiceNum(����������ȣ) | mgtKey(����������ȣ) | taxType(��������) | ';
                tmp := tmp + 'writeDate(�ۼ�����) | regDT(�ӽ������Ͻ�) | senderCorpName(�߽��� ��ȣ) | senderCorpNum(�߽��� ����ڹ�ȣ) | ' ;
                tmp := tmp + 'senderPrintYN(�߽��� �μ⿩��) | receiverCorpName(������ ��ȣ) | receiverCorpNum(������ ����ڹ�ȣ) | ';
                tmp := tmp + 'receiverPrintYN(������ �μ⿩��) | supplyCostTotal(���ް��� �հ�) | taxTotal(���� �հ�) | purposeType(����/û��) | ';
                tmp := tmp + 'issueDT(�����Ͻ�) | stateCode(�����ڵ�) | stateDT(���� �����Ͻ�) | stateMemo(���¸޸�) | ';
                tmp := tmp + 'openYN(���� ����) | openDT(���� �Ͻ�)' + #13 + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + IntToStr(InfoList[i].itemCode) + ' | '
                           + InfoList[i].itemKey + ' | '
                           + InfoList[i].invoiceNum + ' | '
                           + InfoList[i].mgtKey + ' | '
                           + InfoList[i].taxType + ' | '
                           + InfoList[i].writeDate + ' | '
                           + InfoList[i].regDT + ' | '
                           + InfoList[i].senderCorpName + ' | '
                           + InfoList[i].senderCorpNum + ' | '
                           + BoolToStr(InfoList[i].senderPrintYN) + ' | '
                           + InfoList[i].receiverCorpName + ' | '
                           + InfoList[i].receiverCorpNum + ' | '
                           + BoolToStr(InfoList[i].receiverPrintYN) + ' | '
                           + InfoList[i].supplyCostTotal + ' | '
                           + InfoList[i].taxTotal + ' | '
                           + InfoList[i].purposeType + ' | '
                           + InfoList[i].issueDT + ' | '
                           + IntToStr(InfoList[i].stateCode) + ' | '
                           + InfoList[i].stateDT + ' | '
                           + InfoList[i].stateMemo + ' | '
                           + BoolToStr(InfoList[i].openYN) + ' | '
                           + InfoList[i].openDT + #13 + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetLogsClick(Sender: TObject);
var
        LogList : TStatementLogList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ���ڸ��� ���� �����̷��� Ȯ���մϴ�.                               
        { - https://docs.popbill.com/statement/delphi/api#GetLogs
        {**********************************************************************}
        try
                LogList := statementService.getLogs(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
                exit;        
        end
        else
        begin
                tmp := 'DocLogType(�α�Ÿ��) | Log(�̷�����) | ProcType(ó������) | ProcMemo(ó���޸�) | RegDT(����Ͻ�) | IP(������)' + #13;

                for i := 0 to Length(LogList) -1 do
                begin
                    tmp := tmp + IntToStr(LogList[i].DocLogType) + ' | '
                        + LogList[i].Log + ' | '
                        + LogList[i].ProcType + ' | '
                        + LogList[i].ProcMemo + ' | '
                        + LogList[i].RegDT + ' | '
                        + LogList[i].IP + ' | ' + #13;
                end;
                ShowMessage(tmp);
        end;
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
        {**********************************************************************}
        { [���δ��], [����Ϸ�] ������ ���ڸ����� ���ó���մϴ�.           
        { - https://docs.popbill.com/statement/delphi/api#Cancel
        {**********************************************************************}

        //�޸�
        memo := '������� �޸�';

        try
                response := statementService.Cancel(txtCorpNum.text, ItemCode,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { [�ӽ�����] ������ ���ڸ����� [����]ó�� �մϴ�.                    
        { - ����(Issue API)�� ȣ���ϴ� �������� ����Ʈ�� �����˴ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#StmIssue
        {**********************************************************************}

        // �޸�
        memo := '���� �޸�';

        try
                response := statementService.Issue(txtCorpNum.text, ItemCode,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnSendSMSClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        {**********************************************************************}
        { �˸����ڸ� �����մϴ�. (�ܹ�/SMS- �ѱ� �ִ� 45��)
        { - �˸����� ���۽� ����Ʈ�� �����˴ϴ�. (���۽��н� ȯ��ó��)
        { - ���۳��� Ȯ���� "�˺� �α���" > [���� �ѽ�] > [����] > [���۳���]
        {   �޴����� ���۰���� Ȯ���� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#SendSMS
        {**********************************************************************}

        // �߽Ź�ȣ
        sendNum := '070-4304-2991';

        // ���Ź�ȣ
        receivenUm := '010-000-111';

        // �ȳ����� ����, 90byte �ʰ��ϴ� ��� �ʰ��� ������ ���� �˴ϴ�.
        contents := '�ŷ������� ����Ǿ����ϴ�. ���� Ȯ�� �ٶ��ϴ�.';

        try
                response := statementService.SendSMS(txtCorpNum.text, ItemCode, tbMgtKey.Text,
                                        sendNum, receiveNum, contents);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnSendEmailClick(Sender: TObject);
var
        response : TResponse;
        email : String;
begin
        {**********************************************************************}
        { �����ڿ��� ���� �ȳ������� �������մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#SendEmail
        {**********************************************************************}

        // ������ �����ּ�
        email := 'test@test.com';

        try
                response := statementService.SendEmail(txtCorpNum.text, ItemCode,
                                                tbMgtKey.Text, email);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnSendFaxClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { ���ڸ����� �ѽ������մϴ�.
        { - �ѽ� ���� ��û�� ����Ʈ�� �����˴ϴ�. (���۽��н� ȯ��ó��)
        { - ���۳��� Ȯ���� "�˺� �α���" > [���� �ѽ�] > [�ѽ�] > [���۳���]
        {   �޴����� ���۰���� Ȯ���� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#SendFAX
        {**********************************************************************}
        
        // �ѽ� �߽Ź�ȣ
        sendNum := '080-1234-1234';

        // �ѽ� ���Ź�ȣ
        receiveNum := '02-111-222';

        try
                response := statementService.SendFAX(txtCorpNum.text, ItemCode,
                                        tbMgtKey.Text, sendNum, receiveNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ���ڸ��� �ӽ�(����)������ �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetURL
        {**********************************************************************}
        try
                resultURL := statementService.GetURL(txtCorpNum.Text, 'TBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetURL2Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ���ڸ��� ���๮���� �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetURL
        {**********************************************************************}
        
        try
                resultURL := statementService.GetURL(txtCorpNum.Text, 'SBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetPopUpURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 1���� ���ڸ��� ���� �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetPopUpURL
        {**********************************************************************}

        try
                resultURL := statementService.getPopupURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetPrintURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {*******************************************************************}
        { 1���� ���ڸ��� �μ� �˾�(�߽���) URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetPrintURL
        {*******************************************************************}
        
        try
                resultURL := statementService.getPrintURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnGetMailURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���ϸ�ũ URL�� ��ȯ�մϴ�.
        { - ���ϸ�ũ URL�� ��� ��ȿ�ð��� �������� �ʽ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetMailURL
        {**********************************************************************}
        try
                resultURL := statementService.getMailURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetPrintsURLClick(Sender: TObject);
var
        KeyList : Array of String;
        resultURL : String;
begin
       {**********************************************************************}
       { �ټ����� ���ڸ��� �μ� �˾� URL�� ��ȯ�մϴ�. (�ִ� 100��)
       { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
       { - https://docs.popbill.com/statement/delphi/api#GetPrintURL
       {**********************************************************************}

        // ���ڸ��� ����������ȣ �迭, �ִ� 100��
        SetLength(KeyList,2);
        KeyList[0] := '20190114-001';
        KeyList[1] := '20190114-002';

        try
                resultURL := statementService.getMassPrintURL(txtCorpNum.text, ItemCode, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnUpdateClick(Sender: TObject);
var
        statement : TStatement;
        response : TResponse;
begin
        {**********************************************************************}
        { [�ӽ�����] ������ ���ڸ����� �����׸��� �����մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#Update                           
        {**********************************************************************}

        statement := TStatement.Create;
        
        statement.itemCode := ItemCode;
        statement.formCode := txtFormCode.Text;

         // ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û����, 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        statement.itemCode := ItemCode;

        // �������ڵ�, �⺻��(����ó��)
        // ������ ������� �����ϰ��� �ϴ°�� ��Ʈ�ʼ���(1600-8536)�� �����ֽñ� �ٶ��ϴ�.
        statement.formCode := txtFormCode.Text;

        // [�ʼ�] �ۼ�����
        statement.writeDate := '20190319';

        // [�ʼ�] {����, û��} �� ����
        statement.purposeType := '����';

        // [�ʼ�] {����, ����, �鼼} �� ����
        statement.taxType :='����';

        // ����� ������ �˸����� ���ۿ���
        statement.SMSSendYN := false;

         // ����� �ڵ����� ���� (�������� ���ο��ο� ������� ����)
        statement.AutoAcceptYN := false;

        // ���ڸ��� ����������ȣ, 1~24�ڸ�, ����, ����, '-', '_' �������� ����
        // ����ں��� �ߺ����� �ʵ��� ����
        statement.MgtKey := tbMgtKey.Text;


        {**********************************************************************}
        {                             �߽��� ����                              }
        {**********************************************************************}

        // �߽��� ����ڹ�ȣ, '-'���� 10�ڸ�
        statement.senderCorpNum := txtCorpNum.Text;

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderTaxRegID := '';

        // �߽��� ��ȣ
        statement.senderCorpName := '�߽��� ��ȣ_����';

        // �߽��� ��ǥ�� ����
        statement.senderCEOName := '�߽��� ��ǥ�� ����_����';

        // �߽��� �ּ�
        statement.senderAddr := '�߽��� �ּ�_����';

        // �߽��� ����
        statement.senderBizClass := '�߽��� ����_����';

        // �߽��� ����
        statement.senderBizType := '�߽��� ����,����2';

        // �߽��� ����ڸ�
        statement.senderContactName := '�߽��� ����ڸ�';

        // �߽��� ����� �����ּ�
        statement.senderEmail := 'test@test.com';

        // �߽��� ����� ����ó
        statement.senderTEL := '070-7070-0707';

        // �߽��� ����� �޴�����ȣ
        statement.senderHP := '010-000-2222';

        // �߽��� ����� �ѽ�
        statement.senderFAX := '070-000-111';

        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // ������ ����ڹ�ȣ, '-' ���� 10�ڸ�
        statement.receiverCorpNum := '8888888888';

        // ������ ��ȣ
        statement.receiverCorpName := '������ ��ȣ';

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.receiverTaxRegID := '';

        // ������ ��ǥ�� ����
        statement.receiverCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        statement.receiverAddr := '������ �ּ�';

        // ������ ����
        statement.receiverBizClass := '������ ����';

        // ������ ����
        statement.receiverBizType := '������ ����';

        // ������ ����ڸ�
        statement.receiverContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        statement.receiverEmail := 'test@receiver.com';

        // ������ ����� ����ó
        statement.receiverTEL := '070-1234-1234';

        // ������ ����� �޴�����ȣ
        statement.receiverHP := '010-111-222';

        // ������ ����� �ѽ�
        statement.receiverFAX := '070-000-111';


        //[�ʼ�] ���ް��� �հ�
        statement.supplyCostTotal := '200000';

        //[�ʼ�] ���� �հ�
        statement.taxTotal := '20000';

        //[�ʼ�] �հ�ݾ�.  ���ް��� + ����
        statement.totalAmount := '220000';

        //���� �� �Ϸù�ȣ
        statement.serialNum := '1';

        //���
        statement.remark1 := '���1';
        statement.remark2 := '���2';
        statement.remark3 := '���3';

        // ����ڵ���� ÷�ο���
        statement.businessLicenseYN := false;

        // ����纻 ÷�ο���
        statement.bankBookYN := false ;

        {**********************************************************************}
        {                     ���ڸ��� ���׸�(ǰ��) ����                   }
        { �Ϸù�ȣ(serialNum)�� 1���� ���������� �����Ͻñ� �ٶ��ϴ�.          }
        {**********************************************************************}

        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        statement.detailList[0].purchaseDT := '20190114';      //�ŷ�����
        statement.detailList[0].itemName := 'ǰ���';          //ǰ���
        statement.detailList[0].spec := '�԰�';                //�԰�
        statement.detailList[0].qty := '1';                    //����
        statement.detailList[0].unitCost := '100000';          //�ܰ�
        statement.detailList[0].supplyCost := '100000';        //���ް���
        statement.detailList[0].tax := '10000';                //����
        statement.detailList[0].remark := 'ǰ����';          //���
        statement.detailList[0].spare1 := '����1';             //����1
        statement.detailList[0].spare2 := '����2';             //����2
        statement.detailList[0].spare3 := '����3';             //����3
        statement.detailList[0].spare4 := '����4';             //����4
        statement.detailList[0].spare5 := '����5';             //����5

        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        statement.detailList[1].purchaseDT := '20190114';      //�ŷ�����
        statement.detailList[1].itemName := 'ǰ���';          //ǰ���
        statement.detailList[1].spec := '�԰�';                //�԰�
        statement.detailList[1].qty := '1';                    //����
        statement.detailList[1].unitCost := '100000';          //�ܰ�
        statement.detailList[1].supplyCost := '100000';        //���ް���
        statement.detailList[1].tax := '10000';                //����
        statement.detailList[1].remark := 'ǰ����';          //���
        statement.detailList[1].spare1 := '����1';             //����1
        statement.detailList[1].spare2 := '����2';             //����2
        statement.detailList[1].spare3 := '����3';             //����3
        statement.detailList[1].spare4 := '����4';             //����4
        statement.detailList[1].spare5 := '����5';             //����5

        //�߰��Ӽ��׸�, �ڼ��� ������ "[���ڸ��� api �����Ŵ���] > 5.2. �⺻��� �߰��Ӽ� ���̺�" ����
        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';     //���ܾ�
        statement.propertyBag[0].value := '30000';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';    //���ݾ�
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';    //���ܾ�
        statement.propertyBag[2].value := '10000';

        try
                response := statementService.Update(txtCorpNum.text, ItemCode,
                        tbMgtKey.Text, statement );
                statement.Free;
        except
                on le : EPopbillException do begin
                        statement.Free;
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;


procedure TfrmExample.btnGetDetailInfoClick(Sender: TObject);
var
        statement : TStatement;
        tmp : string;
        i : integer;
begin
        {**********************************************************************}
        { 1���� ���ڸ��� ���׸��� Ȯ���մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetDetailInfo                    
        {**********************************************************************}

        try
                statement := statementService.getDetailInfo(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := tmp +'itemCode(�������� �ڵ�) : ' +  IntToStr(statement.itemCode) + #13;
                tmp := tmp +'mgtKey(����������ȣ) : ' +  statement.mgtKey + #13;
                tmp := tmp +'invoiceNum(����������ȣ) : ' +  statement.invoiceNum + #13;
                tmp := tmp +'formCode(������ �ڵ�) : ' +  statement.formCode + #13;
                tmp := tmp +'writeDate(�ۼ�����) : ' +  statement.WriteDate + #13;
                tmp := tmp +'taxType(��������) : ' +  statement.TaxType + #13;
                tmp := tmp +'purposeType(����/û��) : ' +  statement.purposeType + #13;
                tmp := tmp +'serialNum(�Ϸù�ȣ) : ' +  statement.serialNum + #13;
                tmp := tmp +'taxTotal(���� �հ�) : ' +  statement.taxTotal + #13;
                tmp := tmp +'supplyCostTotal(���ް��� �հ�) : ' +  statement.supplyCostTotal + #13;
                tmp := tmp +'totalAmount(�հ�ݾ�) : ' +  statement.totalAmount + #13;
                tmp := tmp +'remark1(���1) : ' +  statement.remark1 + #13;
                tmp := tmp +'remark2(���2) : ' +  statement.remark2 + #13;
                tmp := tmp +'remark3(���3) : ' +  statement.remark3 + #13;

                tmp := tmp +'senderCorpNum(�߽��� ����ڹ�ȣ) : ' +  statement.SenderCorpNum + #13;
                tmp := tmp +'senderTaxRegID(�߽��� ��������ȣ) : ' +  statement.SenderTaxRegID + #13;
                tmp := tmp +'senderCorpName(�߽��� ��ȣ) : ' +  statement.SenderCorpName + #13;
                tmp := tmp +'senderCEOName(�߽��� ��ǥ�ڼ���) : ' +  statement.SenderCEOName + #13;
                tmp := tmp +'senderAddr(�߽��� �ּ�) : ' +  statement.SenderAddr + #13;
                tmp := tmp +'senderBizClass(�߽��� ����) : ' +  statement.SenderBizClass + #13;
                tmp := tmp +'senderBizType(�߽��� ����) : ' +  statement.SenderBizType + #13;
                tmp := tmp +'senderContactName(�߽��� ����) : ' +  statement.SenderContactName + #13;
                tmp := tmp +'senderDeptName(�߽��� �μ�) : ' +  statement.SenderDeptName + #13;
                tmp := tmp +'senderTEL(�߽��� ����ó) : ' +  statement.SenderTEL + #13;
                tmp := tmp +'senderHP(�߽��� �޴���ȭ) : ' +  statement.SenderHP + #13;
                tmp := tmp +'senderEmail(�߽��� �̸���) : ' +  statement.SenderEmail + #13;
                tmp := tmp +'senderFAX(�߽��� �ѽ�) : ' +  statement.senderFAX + #13;

                tmp := tmp +'receiverCorpNum(������ ����ڹ�ȣ) : ' +  statement.ReceiverCorpNum + #13;
                tmp := tmp +'receiverTaxRegID(������ ��������ȣ) : ' +  statement.ReceiverTaxRegID + #13;
                tmp := tmp +'receiverCorpName(������ ��ȣ) : ' +  statement.ReceiverCorpName + #13;
                tmp := tmp +'receiverCEOName(������ ��ǥ�ڼ���) : ' +  statement.ReceiverCEOName + #13;
                tmp := tmp +'receiverAddr(������ �ּ�) : ' +  statement.ReceiverAddr + #13;
                tmp := tmp +'receiverBizClass(������ ����) : ' +  statement.ReceiverBizClass + #13;
                tmp := tmp +'receiverBizType(������ ����) : ' +  statement.ReceiverBizType + #13;
                tmp := tmp +'receiverContactName(������ ����) : ' +  statement.ReceiverContactName + #13;
                tmp := tmp +'receiverDeptName(������ �μ�) : ' +  statement.ReceiverDeptName + #13;
                tmp := tmp +'receiverTEL(������ ����ó) : ' +  statement.ReceiverTEL + #13;
                tmp := tmp +'receiverHP(������ �޴���ȭ) : ' +  statement.ReceiverHP + #13;
                tmp := tmp +'receiverEmail(������ �̸���) : ' +  statement.ReceiverEmail + #13;
                tmp := tmp +'receiverFAX(������ �ѽ�) : ' +  statement.receiverFAX + #13;

                tmp := tmp + '-----���׸�-----' + #13;
                tmp := tmp + 'serialNum(�Ϸù�ȣ) | purchaseDT(�ŷ�����) | itemName(ǰ���) | spec(�԰�) | qty(����) | ';
                tmp := tmp + 'unitCost(�ܰ�) | supplyCost(���ް���) | tax(����) | remark(���) | spare1(����1) |';
                tmp := tmp + 'spare1(����2) | spare1(����3) | spare1(����4) | spare1(����5)' + #13;
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
                         statement.detailList[i].spare5 + ' | ' +
                         statement.detailList[i].spare6 + ' | ' +
                         statement.detailList[i].spare7 + ' | ' +
                         statement.detailList[i].spare8 + ' | ' +
                         statement.detailList[i].spare9 + ' | ' +
                         statement.detailList[i].spare10 + ' | ' +
                         statement.detailList[i].spare11 + ' | ' +
                         statement.detailList[i].spare12 + ' | ' +
                         statement.detailList[i].spare13 + ' | ' +
                         statement.detailList[i].spare14 + ' | ' +
                         statement.detailList[i].spare15 + ' | ' +
                         statement.detailList[i].spare16 + ' | ' +
                         statement.detailList[i].spare17 + ' | ' +
                         statement.detailList[i].spare18 + ' | ' +
                         statement.detailList[i].spare19 + ' | ' +
                         statement.detailList[i].spare20 + #13 ;
                end;

                tmp := tmp + '-----�߰��Ӽ�-----' + #13;
                for i:= 0 to Length(statement.propertyBag)-1 do
                begin
                    tmp := tmp + statement.propertyBag[i].name + ' : ' +
                                 statement.propertyBag[i].value + #13;
                end;

                tmp := tmp +'businessLicenseYN(����ڵ���� ÷�� ����) : ' +  IfThen(statement.businessLicenseYN,'true','false') + #13;
                tmp := tmp +'bankBookYN(����纻 ÷�� ����) : ' +  IfThen(statement.bankBookYN,'true','false') + #13;
                tmp := tmp +'SMSSendYN(���� �ڵ����� ����) : ' +  IfThen(statement.SMSSendYN,'true','false') + #13;
                tmp := tmp +'AutoAcceptYN(����� �ڵ����� ����) : ' +  IfThen(statement.AutoAcceptYN,'true','false') + #13;

                ShowMessage(tmp);
        end;


end;

procedure TfrmExample.btnCheckMgtKeyInUseClick(Sender: TObject);
var
        InUse : boolean;
begin
        {***********************************************************************}
        { ���ڸ����� ����ϱ��� ������ȣ(mgtKey) �ߺ����θ� Ȯ���մϴ�.   
        { - ������ȣ�� 1~24�ڸ� ����, ����, '-', '_' �������� �����Ҽ� �ֽ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#CheckMgtKeyInUse
        {***********************************************************************}

        try
                InUse := statementService.CheckMgtKeyInUse(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                if InUse then ShowMessage('�����') else ShowMessage('�� �����.');
        end;
end;

procedure TfrmExample.Button1Click(Sender: TObject);
var
  resultURL : String;
begin
       {******************************************************************}
       { 1���� ���ڸ��� �μ�(������) URL�� ��ȯ�մϴ�.
       { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
       { - https://docs.popbill.com/statement/delphi/api#GetEPrintURL 
       {******************************************************************}

        try
                resultURL := statementService.getEPrintURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ȸ������(JoinMember API)�� ȣ���ϱ� �� ���̵� �ߺ��� Ȯ���մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#CheckID
        {**********************************************************************}
        try
                response := statementService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { ����ȸ���� ����ڸ� �űԷ� ����մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'testkorea';

        // [�ʼ�] ��й�ȣ (6�� �̻� 20�� �̸�)
        joinInfo.pwd := 'thisispassword';

        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        joinInfo.hp := '010-1111-2222';

        // �ѽ���ȣ (�ִ� 20��)
        joinInfo.fax := '02-6442-9700';

        // [�ʼ�] �̸��� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ȸ����ȸ ���ѿ���, true-ȸ����ȸ / false-������ȸ
        joinInfo.searchAllAllowYN := false;

        // ������ ���ѿ���, true-������ / false-�����
        joinInfo.mgrYN := false;

        try
                response := statementService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ����� Ȯ���մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#ListContact 
        {**********************************************************************}

        try
                InfoList := statementService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'id(���̵�) | email(�̸���) | hp(�޴���) | personName(����) | searchAllAllowYN(ȸ����ȸ ����) | ';
        tmp := tmp + 'tel(����ó) | fax(�ѽ�) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

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
            tmp := tmp + InfoList[i].regDT + ' | ';
            tmp := tmp + IntToStr(InfoList[i].state) + #13;
        end;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ������ �����մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        contactInfo.hp := '010-4324-1111';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // �ѽ���ȣ (�ִ� 20��)
        contactInfo.fax := '02-6442-9799';

        // ��ȸ����, true(ȸ����ȸ), false(������ȸ)
        contactInfo.searchAllAllowYN := true;

        // �����ڱ��� ��������, true-������ / false-�����
        contactInfo.mgrYN := false;

        try
                response := statementService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetCorpInfo
        {**********************************************************************}
        try
                corpInfo := statementService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (��ȣ) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (��ǥ�� ����) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 100��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 200��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 100��
        corpInfo.bizType := '����';

        // ����, �ִ� 100��
        corpInfo.bizClass := '����';

        // �ּ�, �ִ� 300��
        corpInfo.addr := '����Ư���� ������ ������� 517';

        try
                response := statementService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnRegistIssueClick(Sender: TObject);
var
        statement : TStatement;
        response : TResponse;
        memo, emailSubject : String;
begin
        {**********************************************************************}
        { 1���� ���ڸ����� ��ù��� ó���մϴ�. (����)
        { - https://docs.popbill.com/statement/delphi/api#RegistIssue                      
        {**********************************************************************}

        statement := TStatement.Create;

        // ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û����, 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        statement.itemCode := ItemCode;

        // �������ڵ�, �⺻��(����ó��)
        // ������ ������� �����ϰ��� �ϴ°�� ��Ʈ�ʼ���(1600-8536)�� �����ֽñ� �ٶ��ϴ�.
        statement.formCode := txtFormCode.Text;

        // [�ʼ�] �ۼ�����
        statement.writeDate := '20191128';

        // [�ʼ�] {����, û��} �� ����
        statement.purposeType := '����';

        // [�ʼ�] {����, ����, �鼼} �� ����
        statement.taxType :='����';

        // ����� ������ �˸����� ���ۿ���
        statement.SMSSendYN := false;

         // ����� �ڵ����� ���� (�������� ���ο��ο� ������� ����)
        statement.AutoAcceptYN := false;

        // [�ʼ�] ���ڸ��� ����������ȣ, 1~24�ڸ�, ����, ����, '-', '_'
        // �������� ��������ں��� �ߺ����� �ʵ��� ����
        statement.MgtKey := tbMgtKey.Text;

        {**********************************************************************}
        {                             �߽��� ����                              }
        {**********************************************************************}

        // �߽��� ����ڹ�ȣ, '-'���� 10�ڸ�
        statement.senderCorpNum := txtCorpNum.Text;

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderTaxRegID := '';

        // �߽��� ��ȣ
        statement.senderCorpName := '�߽��� ��ȣ';

        // �߽��� ��ǥ�� ����
        statement.senderCEOName := '�߽��� ��ǥ�� ����';

        // �߽��� �ּ�
        statement.senderAddr := '�߽��� �ּ�';

        // �߽��� ����
        statement.senderBizClass := '�߽��� ����';

        // �߽��� ����
        statement.senderBizType := '�߽��� ����,����2';

        // �߽��� ����ڸ�
        statement.senderContactName := '�߽��� ����ڸ�';

        // �߽��� ����� �����ּ�
        statement.senderEmail := 'test@test.com';

        // �߽��� ����� ����ó
        statement.senderTEL := '070-7070-0707';

        // �߽��� ����� �޴�����ȣ
        statement.senderHP := '010-000-2222';

        // �߽��� ����� �ѽ�
        statement.senderFAX := '070-000-111';

        {**********************************************************************}
        {                            ������ ����                               }
        {**********************************************************************}

        // ������ ����ڹ�ȣ, '-' ���� 10�ڸ�
        statement.receiverCorpNum := '8888888888';

        // ������ ��ȣ
        statement.receiverCorpName := '������ ��ȣ';

        //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.receiverTaxRegID := '';

        // ������ ��ǥ�� ����
        statement.receiverCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        statement.receiverAddr := '������ �ּ�';

        // ������ ����
        statement.receiverBizClass := '������ ����';

        // ������ ����
        statement.receiverBizType := '������ ����';

        // ������ ����ڸ�
        statement.receiverContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        statement.receiverEmail := 'test@test.com';

        // ������ ����� ����ó
        statement.receiverTEL := '070-1234-1234';

        // ������ ����� �޴�����ȣ
        statement.receiverHP := '010-111-222';

        // ������ ����� �ѽ�
        statement.receiverFAX := '070-000-111';


        //[�ʼ�] ���ް��� �հ�
        statement.supplyCostTotal := '200000';

        //[�ʼ�] ���� �հ�
        statement.taxTotal := '20000';

        //[�ʼ�] �հ�ݾ�.  ���ް��� + ����
        statement.totalAmount := '220000';

        // ���� �� �Ϸù�ȣ
        statement.serialNum := '1';

        // ���
        statement.remark1 := '���1';
        statement.remark2 := '���2';
        statement.remark3 := '���3';

        // ����ڵ���� ÷�ο���
        statement.businessLicenseYN := false;

        // ����纻 ÷�ο���
        statement.bankBookYN := false;

        {**********************************************************************}
        {                     ���ڸ��� ���׸�(ǰ��) ����                   }
        { �Ϸù�ȣ(serialNum)�� 1���� ���������� �����Ͻñ� �ٶ��ϴ�.          }
        {**********************************************************************}

        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        statement.detailList[0].purchaseDT := '20190114';      //�ŷ�����
        statement.detailList[0].itemName := 'ǰ���';          //ǰ���
        statement.detailList[0].spec := '�԰�';                //�԰�
        statement.detailList[0].qty := '1';                    //����
        statement.detailList[0].unitCost := '100000';          //�ܰ�
        statement.detailList[0].supplyCost := '100000';        //���ް���
        statement.detailList[0].tax := '10000';                //����
        statement.detailList[0].remark := 'ǰ����';          //���
        statement.detailList[0].spare1 := '����1';             //����1
        statement.detailList[0].spare2 := '����2';             //����2
        statement.detailList[0].spare3 := '����3';             //����3
        statement.detailList[0].spare4 := '����4';             //����4
        statement.detailList[0].spare5 := '����5';             //����5

        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        statement.detailList[1].purchaseDT := '20190114';      //�ŷ�����
        statement.detailList[1].itemName := 'ǰ���';          //ǰ���
        statement.detailList[1].spec := '�԰�';                //�԰�
        statement.detailList[1].qty := '1';                    //����
        statement.detailList[1].unitCost := '100000';          //�ܰ�
        statement.detailList[1].supplyCost := '100000';        //���ް���
        statement.detailList[1].tax := '10000';                //����
        statement.detailList[1].remark := 'ǰ����';          //���
        statement.detailList[1].spare1 := '����1';             //����1
        statement.detailList[1].spare2 := '����2';             //����2
        statement.detailList[1].spare3 := '����3';             //����3
        statement.detailList[1].spare4 := '����4';             //����4
        statement.detailList[1].spare5 := '����5';             //����5

        {**********************************************************************}
        {                           �߰��Ӽ� �׸�                              }
        { - �߰��Ӽ� �׸� ���� �ڼ��� ������ "[���ڸ��� api �����Ŵ���] >  }
        {   5.2. �⺻��� �߰��Ӽ� ���̺�" �����Ͻñ� �ٶ��ϴ�.                }
        {**********************************************************************}

        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';     //���ܾ�
        statement.propertyBag[0].value := '30000';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';    //���ݾ�
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';    //���ܾ�
        statement.propertyBag[2].value := '10000';

        memo := '��ù��� �޸�';

        // �ȳ����� ����, �̱���� �⺻������� ����
        emailSubject := '';

        try
                response := statementService.RegistIssue(txtCorpNum.text, statement, memo, txtUserID.text, emailSubject);
                statement.Free;
        except
                on le : EPopbillException do begin
                        statement.Free;
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetChargeURL
        {**********************************************************************}
        try
                resultURL := statementService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL : ' + #13 + resultURL);
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ��Ʈ���� ����ȸ������ ���Ե� ����ڹ�ȣ���� Ȯ���մϴ�.
        { - LinkID�� ��Ʈ�ʸ� �ĺ��ϴ� ��������(32������)�� �����Ǿ� �ֽ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#CheckIsMember
        {**********************************************************************}
        try
                response := statementService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnCancelClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { [���δ��], [����Ϸ�] ������ ���ڸ����� ���ó���մϴ�.           
        { - [�������] ���ڸ����� ������ȣ(mgtKey)�� ����(Delete API)��  
        {   ȣ���Ͽ� [����] ���¿��� ���� �� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#Cancel
        {**********************************************************************}

        // �޸�
        memo := '������� �޸�';

        try
                response := statementService.Cancel(txtCorpNum.text, ItemCode, tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnDelete_registIssueClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 1���� ���ڸ����� [����]�մϴ�. ���ڸ����� ������ ��쿡��        
        { ������ȣ(mgtKey)�� ���� �� �� �ֽ��ϴ�.                        
        { - ���������� ���� ���� : [�ӽ�����], [�������], [�ź�]
        { - https://docs.popbill.com/statement/delphi/api#Delete
        {**********************************************************************}

        try
                response := statementService.Delete(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnFaxSendClick(Sender: TObject);
var
        statement : TStatement;
        response : String;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { ���ڸ����� �ѽ��� �����մϴ�.
        { - �˺��� ���ڸ����� ��ϵ��� �ʰ� �ѽ��� ���۵˴ϴ�.
        { - ���۰���� [�˺�Ȩ������] > [����, �ѽ�] > [�ѽ�] > [���۳���]
        {   �޴� ���� Ȯ���� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#FAXSend
        {**********************************************************************}

        // �߽Ź�ȣ
        sendNum := '070-4304-2991';

        // �����ѽ���ȣ
        receiveNum := '02-000-111';

        // ���ڸ��� ��ü �ʱ�ȭ
        statement := TStatement.Create;

        // ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        statement.itemCode := ItemCode;

        // �������ڵ�, �⺻��(����ó��)
        // ������ ������� �����ϰ��� �ϴ°�� ��Ʈ�ʼ���(1600-8536)�� �����ֽñ� �ٶ��ϴ�.
        statement.formCode := txtFormCode.Text;

        // [�ʼ�] �ۼ�����
        statement.writeDate := '20190114';

        // [�ʼ�] {����, û��} �� ����
        statement.purposeType := '����';

        // [�ʼ�] {����, ����, �鼼} �� ����
        statement.taxType :='����';

        // ����� ������ �˸����� ���ۿ���
        statement.SMSSendYN := false;

         // ����� �ڵ����� ���� (�������� ���ο��ο� ������� ����)
        statement.AutoAcceptYN := true;

        // �ŷ����� ������ȣ, 1~24�ڸ�, ����, ����, '-', '_' �������� ����
        // ����ں��� �ߺ����� �ʵ��� ����
        statement.MgtKey := tbMgtKey.Text;

        {**********************************************************************}
        {                             �߽��� ����                              }
        {**********************************************************************}

        // �߽��� ����ڹ�ȣ, '-'���� 10�ڸ�
        statement.senderCorpNum := txtCorpNum.Text;

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderTaxRegID := '';

        // �߽��� ��ȣ
        statement.senderCorpName := '�߽��� ��ȣ';

        // �߽��� ��ǥ�� ����
        statement.senderCEOName := '�߽��� ��ǥ�� ����';

        // �߽��� �ּ�
        statement.senderAddr := '�߽��� �ּ�';

        // �߽��� ����
        statement.senderBizClass := '�߽��� ����';

        // �߽��� ����
        statement.senderBizType := '�߽��� ����,����2';

        // �߽��� ����ڸ�
        statement.senderContactName := '�߽��� ����ڸ�';

        // �߽��� ����� �����ּ�
        statement.senderEmail := 'test@test.com';

        // �߽��� ����� ����ó
        statement.senderTEL := '070-7070-0707';

        // �߽��� ����� �޴�����ȣ
        statement.senderHP := '010-000-2222';


        {**********************************************************************}
        {                              ������ ����                             }
        {**********************************************************************}

        // ������ ����ڹ�ȣ, '-' ���� 10�ڸ�
        statement.receiverCorpNum := '8888888888';

        // ������ ��ȣ
        statement.receiverCorpName := '������ ��ȣ';

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.receiverTaxRegID := '';

        // ������ ��ǥ�� ����
        statement.receiverCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        statement.receiverAddr := '������ �ּ�';

        // ������ ����
        statement.receiverBizClass := '������ ����';

        // ������ ����
        statement.receiverBizType := '������ ����';

        // ������ ����ڸ�
        statement.receiverContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        statement.receiverEmail := 'test@receiver.com';

        // ������ ����� ����ó
        statement.receiverTEL := '070-1234-1234';

        // ������ ����� �޴�����ȣ
        statement.receiverHP := '010-111-222';


        //�ʼ� ���ް��� �հ�
        statement.supplyCostTotal := '200000';

        //�ʼ� ���� �հ�
        statement.taxTotal := '20000';

        //�ʼ� �հ�ݾ�.  ���ް��� + ����
        statement.totalAmount := '220000';

        // ���� �� �Ϸù�ȣ
        statement.serialNum := '1';

        statement.remark1 := '���1';
        statement.remark2 := '���2';
        statement.remark3 := '���3';

        // ����ڵ���� ÷�ο���
        statement.businessLicenseYN := false;

        // ����纻 ÷�ο���
        statement.bankBookYN := false ;

        {**********************************************************************}
        {                     ���ڸ��� ���׸�(ǰ��) ����                   }
        { �Ϸù�ȣ(serialNum)�� 1���� ���������� �����Ͻñ� �ٶ��ϴ�.          }
        {**********************************************************************}
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        statement.detailList[0].purchaseDT := '20190114';      //�ŷ�����
        statement.detailList[0].itemName := 'ǰ���';          //ǰ���
        statement.detailList[0].spec := '�԰�';                //�԰�
        statement.detailList[0].qty := '1';                    //����
        statement.detailList[0].unitCost := '100000';          //�ܰ�
        statement.detailList[0].supplyCost := '100000';        //���ް���
        statement.detailList[0].tax := '10000';                //����
        statement.detailList[0].remark := 'ǰ����';          //���
        statement.detailList[0].spare1 := '����1';             //����1
        statement.detailList[0].spare2 := '����2';             //����2
        statement.detailList[0].spare3 := '����3';             //����3
        statement.detailList[0].spare4 := '����4';             //����4
        statement.detailList[0].spare5 := '����5';             //����5

        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        statement.detailList[1].purchaseDT := '20190114';      //�ŷ�����
        statement.detailList[1].itemName := 'ǰ���';          //ǰ���
        statement.detailList[1].spec := '�԰�';                //�԰�
        statement.detailList[1].qty := '1';                    //����
        statement.detailList[1].unitCost := '100000';          //�ܰ�
        statement.detailList[1].supplyCost := '100000';        //���ް���
        statement.detailList[1].tax := '10000';                //����
        statement.detailList[1].remark := 'ǰ����';          //���
        statement.detailList[1].spare1 := '����1';             //����1
        statement.detailList[1].spare2 := '����2';             //����2
        statement.detailList[1].spare3 := '����3';             //����3
        statement.detailList[1].spare4 := '����4';             //����4
        statement.detailList[1].spare5 := '����5';             //����5

        {**********************************************************************}
        {                           �߰��Ӽ� �׸�                              }
        { - �߰��Ӽ� �׸� ���� �ڼ��� ������ "[���ڸ��� api �����Ŵ���] >  }
        {   5.2. �⺻��� �߰��Ӽ� ���̺�" �����Ͻñ� �ٶ��ϴ�.                }
        {**********************************************************************}

        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';     //���ܾ�
        statement.propertyBag[0].value := '30000';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';    //���ݾ�
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';    //���ܾ�
        statement.propertyBag[2].value := '10000';

        try
                response := statementService.FAXSend(txtCorpNum.text, statement, sendNum, receiveNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�ѽ�������ȣ(receiptNum) : '+ response);
        end;
        
end;

procedure TfrmExample.btnSearchClick(Sender: TObject);
var
        DType : String;
        SDate : String;
        EDate : String;
        StateList : Array Of String;
        ItemCodeList : Array Of Integer;
        QString : String;
        Page : Integer;
        PerPage : Integer;
        Order : String;
        tmp : String;
        i : integer;
        SearchList : TStatementSearchList;
begin
        {********************************************************************}
        { �˻����ǵ��� �̿��� ���ڸ��� ����� ��ȸ�մϴ�.                  
        { - https://docs.popbill.com/statement/delphi/api#Search
        {********************************************************************}

        // [�ʼ�] �������� { R: �������, W:�ۼ�����, I:�������� }
        DType := 'W';

        // [�ʼ�] �˻� ��������, �ۼ�����(yyyyMMdd)
        SDate := '20190101';

        // [�ʼ�] �˻� ��������, �ۼ�����(yyyyMMdd)
        EDate := '20190114';

        // ���ۻ��°� �迭. �̱���� ��ü��ȸ, �������� �� 3�ڸ��� �迭, 2,3��° �ڸ� ���ϵ� ī�� ��밡��
        // �����ڵ忡 ���� �ڼ��� ������ "[���ڸ��� API�����Ŵ���] > 5.1 ���ڸ��� �����ڵ�" �� �����Ͻñ� �ٶ��ϴ�.
        SetLength(StateList, 2);
        StateList[0] := '2**';
        StateList[1] := '3**';

        { �������� �ڵ�迭
         121 - �ŷ�����, 122 - û����
         123 - ������, 124 - ���ּ�
         125 - �Ա�ǥ, 126 - ������ }
        SetLength(ItemCodeList, 6);
        ItemCodeList[0] := 121;
        ItemCodeList[1] := 122;
        ItemCodeList[2] := 123;
        ItemCodeList[3] := 124;
        ItemCodeList[4] := 125;
        ItemCodeList[5] := 126;

        // �ŷ�ó ����, �ŷ�ó ��ȣ �Ǵ� �ŷ�ó ����ڵ�Ϲ�ȣ ����, �̱���� ��ü��ȸ
        QString := '';

        // ������ ��ȣ, �⺻�� 1
        Page := 1;

        // �������� �˻�����, �⺻�� 500, �ִ� 1000
        PerPage := 30;

        // ���Ĺ���, 'D' : �������� , 'A' : ��������
        Order := 'D';

        try
                SearchList := statementService.Search(txtCorpNum.text,DType, SDate,
                                EDate, StateList, ItemCodeList, QString, Page, PerPage, Order);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        SearchList.Free;
                        Exit;
                end;
        end;

        tmp := 'code(�����ڵ�) : '+IntToStr(SearchList.code) + #13;
        tmp := tmp + 'total(�� �˻���� �Ǽ�) : '+ IntToStr(SearchList.total) + #13;
        tmp := tmp + 'perPage(�������� �˻�����) : '+ IntToStr(SearchList.perPage) + #13;
        tmp := tmp + 'pageNum(������ ��ȣ) : '+ IntToStr(SearchList.pageNum) + #13;
        tmp := tmp + 'pageCount(������ ����) : '+ IntToStr(SearchList.pageCount) + #13;
        tmp := tmp + 'message(����޽���) : '+ SearchList.message + #13#13;

        tmp := tmp + 'itemCode(���������ڵ�) | itemKey(�˺� ������ȣ) | invoiceNum(����������ȣ) | mgtKey(������ȣ) | taxType(��������) | ';
        tmp := tmp + 'writeDate(�ۼ�����) | regDT(�ӽ������Ͻ�) | senderCorpName(�߽��� ��ȣ) | senderCorpNum(�߽��� ����ڹ�ȣ) | ' ;
        tmp := tmp + 'senderPrintYN(�߽��� �μ⿩��) | receiverCorpName(������ ��ȣ) | receiverCorpNum(������ ����ڹ�ȣ) | ';
        tmp := tmp + 'receiverPrintYN(������ �μ⿩��) | supplyCostTotal(���ް��� �հ�) | taxTotal(���� �հ�) | purposeType(����/û��) | ';
        tmp := tmp + 'issueDT(�����Ͻ�) | stateCode(�����ڵ�) | stateDT(���� �����Ͻ�) | stateMemo(���¸޸�) | ';
        tmp := tmp + 'openYN(���� ����) | openDT(���� �Ͻ�)' + #13 + #13;

        for i := 0 to Length(SearchList.list) -1 do
        begin
            tmp := tmp + IntToStr(SearchList.list[i].itemCode) + ' | '
                   + SearchList.list[i].itemKey + ' | '
                   + SearchList.list[i].invoiceNum + ' | '
                   + SearchList.list[i].mgtKey + ' | '
                   + SearchList.list[i].taxType + ' | '
                   + SearchList.list[i].writeDate + ' | '
                   + SearchList.list[i].regDT + ' | '
                   + SearchList.list[i].senderCorpName + ' | '
                   + SearchList.list[i].senderCorpNum + ' | '
                   + BoolToStr(SearchList.list[i].senderPrintYN) + ' | '
                   + SearchList.list[i].receiverCorpName + ' | '
                   + SearchList.list[i].receiverCorpNum + ' | '
                   + BoolToStr(SearchList.list[i].receiverPrintYN) + ' | '
                   + SearchList.list[i].supplyCostTotal + ' | '
                   + SearchList.list[i].taxTotal + ' | '
                   + SearchList.list[i].purposeType + ' | '
                   + SearchList.list[i].issueDT + ' | '
                   + IntToStr(SearchList.list[i].stateCode) + ' | '
                   + SearchList.list[i].stateDT + ' | '
                   + SearchList.list[i].stateMemo + ' | '
                   + BoolToStr(SearchList.list[i].openYN) + ' | '
                   + SearchList.list[i].openDT + #13 + #13;;
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
        {**********************************************************************}
        { ���ڸ����� �ٸ� ���ڸ����� ÷���մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#AttachStatement
        {**********************************************************************}

        // ÷���� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubItemCode := 121;

        // ÷���� ���ڸ��� ������ȣ
        SubMgtKey := '20190114-002';

        try
                response := statementService.AttachStatement(txtCorpNum.text, ItemCode, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnDetachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {**********************************************************************}
        { ÷�ε� ���ڸ����� ÷�������մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#DetachStatement
        {**********************************************************************}

        // ÷�������� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubItemCode := 121;

        // ÷�������� ���ڸ��� ������ȣ
        SubMgtKey := '20190114-002';

        try
                response := statementService.DetachStatement(txtCorpNum.text, ItemCode, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TStatementChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { ����ȸ���� ���ڸ��� API ���� ���������� Ȯ���մϴ�.
        { - ���ڸ��� �����ڵ�(ItemCode) �� ���������� Ȯ���� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/statement/delphi/api#GetChargeInfo
        {**********************************************************************}
        
        try
                chargeInfo := statementService.GetChargeInfo(txtCorpNum.text, ItemCode);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetSealURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { �ΰ� �� ÷�ι��� ���  URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        {**********************************************************************}
        try
                resultURL := statementService.getSealURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ��Ʈ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.                                 }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        { - https://docs.popbill.com/statement/delphi/api#GetPartnerURL 
        {**********************************************************************}
        
        try
                resultURL := statementService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL : ' + #13 + resultURL);
end;

procedure TfrmExample.btnListEmailConfigClick(Sender: TObject);
var
        EmailConfigList : TEmailConfigList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ���ڸ��� �������� �׸� ���� ���ۿ��θ� ������� ��ȯ�մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#ListEmailConfig
        {**********************************************************************}

        try
                EmailConfigList := statementService.ListEmailConfig(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+  statementService.LastErrMessage);
        end
        else
        begin
                tmp := 'emailType(������������) | sendYN(���ۿ���)' + #13;
                for i := 0 to Length(EmailConfigList) -1 do
                begin
                    if EmailConfigList[i].EmailType = 'SMT_ISSUE' then
                        tmp := tmp + 'SMT_ISSUE (�����ڿ��� ���ڸ����� ���� �Ǿ����� �˷��ִ� �����Դϴ�.) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                    if EmailConfigList[i].EmailType = 'SMT_ACCEPT' then
                        tmp := tmp + 'SMT_ACCEPT (�߽��ڿ��� ���ڸ����� ���� �Ǿ����� �˷��ִ� �����Դϴ�.) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                    if EmailConfigList[i].EmailType = 'SMT_DENY' then
                        tmp := tmp + 'SMT_DENY (�߽��ڿ��� ���ڸ����� �ź� �Ǿ����� �˷��ִ� �����Դϴ�.) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                    if EmailConfigList[i].EmailType = 'SMT_CANCEL' then
                        tmp := tmp + 'SMT_CANCEL (�����ڿ��� ���ڸ����� ��� �Ǿ����� �˷��ִ� �����Դϴ�.) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                    if EmailConfigList[i].EmailType = 'SMT_CANCEL_ISSUE' then
                        tmp := tmp + 'SMT_CANCEL_ISSUE (�����ڿ��� ���ڸ����� ������� �Ǿ����� �˷��ִ� �����Դϴ�.) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateEmailConfigClick(Sender: TObject);
var
        response : TResponse;
        EmailType : String;
        SendYN    : Boolean;
begin
        {***********************************************************************************}
        { ���ڸ��� �������� �׸� ���� ���ۿ��θ� �����մϴ�.
        { - https://docs.popbill.com/statement/delphi/api#UpdateEmailConfig
        {
        { ������������
        {  SMT_ISSUE : �����ڿ��� ���ڸ����� ���� �Ǿ����� �˷��ִ� ���� �˸�
        {  SMT_ACCEPT : �߽��ڿ��� ���ڸ����� ���� �Ǿ����� �˷��ִ� ���� �˸�
        {  SMT_DENY : �߽��ڿ��� ���ڸ����� �ź� �Ǿ����� �˷��ִ� ���� �˸�
        {  SMT_CANCEL : �����ڿ��� ���ڸ����� ��� �Ǿ����� �˷��ִ� ���� �˸�
        {  SMT_CANCEL_ISSUE : �����ڿ��� ���ڸ����� ������� �Ǿ����� �˷��ִ� ���� �˸�  
        {***********************************************************************************}

        // ������������
        EmailType := 'SMT_ISSUE';

        // ���ۿ��� (True - ����, False - ������)
        SendYN := True;

        try
                response := statementService.UpdateEmailConfig(txtCorpNum.text, EmailType, SendYN);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;


procedure TfrmExample.btnGetPDFURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {*******************************************************************}
        { 1���� ���ڸ��� ���� �˾� URL�� ��ȯ�մϴ�.(�޴�,��ư ����)
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        {*******************************************************************}
        
        try
                resultURL := statementService.getViewURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(statementService.LastErrCode) + #10#13 +'����޽��� : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

end.
