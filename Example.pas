{******************************************************************************}
{ �˺� ���ڸ��� API Delphi SDK Example                                        }
{                                                                              }
{ - ������ SDK ������ �ȳ� : http://blog.linkhub.co.kr/572                   }
{ - ������Ʈ ���� : 2017-08-30                                                 }
{ - ���� ������� ����ó : 1600-8536 / 070-4304-2991                           }
{ - ���� ������� �̸��� : code@linkhub.co.kr                                  }
{                                                                              }
{ <�׽�Ʈ �������� �غ����>                                                   }
{ (1) 32, 35�� ���ο� ����� ��ũ���̵�(LinkID)�� ���Ű(SecretKey)��          }
{    ��ũ��� ���Խ� ���Ϸ� �߱޹��� ���������� ����                           }
{ (2) �˺� ���߿� ����Ʈ(test.popbill.com)�� ����ȸ������ ����                 }
{                                                                              }
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
    btnReSendEmail: TButton;
    btnReSendSMS: TButton;
    btnSendInvoiceFax: TButton;
    tbMgtKey: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoin: TButton;
    GroupBox11: TGroupBox;
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
    btnIssueFax: TButton;
    btnSearch: TButton;
    btnAttachStatement: TButton;
    btnDetachStatement: TButton;
    btnGetChargeInfo: TButton;
    btnGetPopbillURL_SEAL: TButton;
    GroupBox13: TGroupBox;
    GroupBox16: TGroupBox;
    btnGetBalance: TButton;
    btnGetPopbillURL_CHRG: TButton;
    btnGetPartnerBalance: TButton;
    btnGetPartnerURL_CHRG: TButton;
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
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnGetPopbillURL_SEALClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
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
        {**********************************************************************}
        {    �˺�(www.popbill.com)�� �α��ε� �˾� URL�� ��ȯ�մϴ�.           }
        {    URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.      }
        {**********************************************************************}

        try
                resultURL := statementService.getPopbillURL(txtCorpNum.Text, txtUserID.Text, 'LOGIN');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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

        {**********************************************************************}
        {    ��Ʈ���� ����ȸ������ ȸ�������� ��û�մϴ�.                      }
        {    ���̵� �ߺ�Ȯ���� btnCheckIDClick ���ν����� �����Ͻñ� �ٶ��ϴ�. }
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ '-' ����, 10�ڸ�
        joinInfo.CorpNum := '1234567890';

        // ��ǥ�ڼ���, �ִ� 30��
        joinInfo.CEOName := '��ǥ�ڼ���';

        // ��ȣ��, �ִ� 70��
        joinInfo.CorpName := '��ũ���';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 40��
        joinInfo.BizType := '����';

        // ����, �ִ� 40��
        joinInfo.BizClass := '����';

        // ���̵�, 6���̻� 20�� �̸�
        joinInfo.ID     := 'userid';

        // ��й�ȣ, 6���̻� 20�� �̸�
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // ����ڸ�, �ִ� 30��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� �޴�����ȣ, �ִ� 20��
        joinInfo.ContactHP := '010-000-1111';

        // ����� �ѽ���ȣ, �ִ� 20��
        joinInfo.ContactFAX := '02-6442-9700';

        // ����� ����, �ִ� 70��
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
        { ���ڸ��� 1���� [�ӽ�����] �մϴ�.                                  }
        { - ���ڸ��� �ӽ�����(Register API) ȣ���Ŀ��� ����(Issue API)��     }
        {   ȣ���ؾ߸� �����ڿ��� ������ ���۵˴ϴ�.                           }
        { - �ӽ������ ������ �ѹ��� ȣ��� ó���ϴ� ��ù���(RegistIssue API) }
        {   ���μ����� �����մϴ�.                                             }
        { - ���ڸ��� �׸� ������ "[���ڸ��� API �����Ŵ���] >            }
        {   4.1. ���ڸ��� ����" �� �����Ͻñ� �ٶ��ϴ�.                      }
        {**********************************************************************}

         // ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        statement.itemCode := ItemCode;

        // �������ڵ�, �⺻��(����ó��)
        // ������ ������� �����ϰ��� �ϴ°�� ��ũ���� �����Ͽ� �ֽø�
        // �������� �����Ͽ� ����ڵ带 �߱��Ͽ� �帳�ϴ�.
        statement.formCode := txtFormCode.Text;

        // [�ʼ�] �ۼ�����, �ۼ���� yyyyMMdd
        statement.writeDate := '20170222';

        // [�ʼ�] {����, û��} �� ����
        statement.purposeType := '����';

        // [�ʼ�] {����, ����, �鼼} �� ����
        statement.taxType :='����';

        // ����� ������ �˸����� ���ۿ���
        statement.SMSSendYN := false;

        // ������ ���ξ��� ����ÿ� ���� ó������.
        statement.AutoAcceptYN := false;

        // ���ڸ��� ����������ȣ, 1~24�ڸ�, ����, ����, '-', '_' �������� ����
        // ����ں��� �ߺ����� �ʵ��� ����
        statement.MgtKey := tbMgtKey.Text;


        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // ������ ����ڹ�ȣ, '-'���� 10�ڸ�
        statement.senderCorpNum := '1234567890';

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderTaxRegID := '';

        // ������ ��ȣ
        statement.senderCorpName := '������ ��ȣ';

        // ������ ��ǥ�� ����
        statement.senderCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        statement.senderAddr := '������ �ּ�';

        // ������ ����
        statement.senderBizClass := '������ ����';

        // ������ ���� 
        statement.senderBizType := '������ ����,����2';

        // ������ ����ڸ�
        statement.senderContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        statement.senderEmail := 'test@test.com';

        // ������ ����� ����ó 
        statement.senderTEL := '070-7070-0707';

        // ������ ����� �޴�����ȣ
        statement.senderHP := '010-000-2222';


        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // ���޹޴��� ����ڹ�ȣ, '-' ���� 10�ڸ� 
        statement.receiverCorpNum := '8888888888';

        // ���޹޴��� ��ȣ 
        statement.receiverCorpName := '���޹޴��� ��ȣ';

        //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.receiverTaxRegID := '';

        // ���޹޴��� ��ǥ�� ����
        statement.receiverCEOName := '���޹޴��� ��ǥ�� ����';

        // ���޹޴��� �ּ�
        statement.receiverAddr := '���޹޴��� �ּ�';

        // ���޹޴��� ����
        statement.receiverBizClass := '���޹޴��� ����';

        // ���޹޴��� ����
        statement.receiverBizType := '���޹޴��� ����';

        // ���޹޴��� ����ڸ�
        statement.receiverContactName := '���޹޴��� ����ڸ�';

        // ���޹޴��� ����� �����ּ�
        statement.receiverEmail := 'test@receiver.com';

        // ���޹޴��� ����� ����ó 
        statement.receiverTEL := '070-1234-1234';

        // ���޹޴��� ����� �޴�����ȣ
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
        { ���׸��� 0~99������ �ۼ��� �����ϸ�, �Ϸù�ȣ(serialNum)�� 1���� 99}
        { ���� ���������� �����Ͻñ� �ٶ��ϴ�.                                 }
        {**********************************************************************}

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
        statement.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        statement.detailList[1].purchaseDT := '20151211';      //�ŷ�����
        statement.detailList[1].itemName := 'ǰ���';
        statement.detailList[1].spec := '�԰�';
        statement.detailList[1].qty := '1';                    //����
        statement.detailList[1].unitCost := '100000';          //�ܰ�
        statement.detailList[1].supplyCost := '100000';        //���ް���
        statement.detailList[1].tax := '10000';                //����
        statement.detailList[1].remark := 'ǰ����';
        statement.detailList[1]._unit := '';                   //����
        statement.detailList[1].spare1 := '';
        statement.detailList[1].spare2 := '';
        statement.detailList[1].spare3 := '';
        statement.detailList[1].spare4 := '';
        statement.detailList[1].spare5 := '';

        {**********************************************************************}
        {                           �߰��Ӽ� �׸�                              }
        { - �߰��Ӽ� �׸� ���� �ڼ��� ������ "[���ڸ��� api �����Ŵ���] >  }
        {   5.2. �⺻��� �߰��Ӽ� ���̺�" �����Ͻñ� �ٶ��ϴ�.                }
        {**********************************************************************}

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
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ���������� �ƴ�       }
        { ��Ʈ�ʰ����� ��� ��Ʈ�� �ܿ�����Ʈ Ȯ��(GetPartnerBalance API) ��� }
        { �̿��Ͻñ� �ٶ��ϴ�                                                  }
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
        { ���ڸ��� ������(ItemCode) ����ܰ��� Ȯ���մϴ�.                   }
        { 121 - �ŷ����� / 122 - û���� / 123 - ������                       }
        { 124 - ���ּ� / 125 - �Ա�ǥ / 126 - ������                           }
        {**********************************************************************}

        try
                unitcost := statementService.GetUnitCost(txtCorpNum.text, ItemCode);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage(cbItemCode.Text +' ����ܰ� : '+ FloatToStr(unitcost));
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ��Ʈ�ʰ����� �ƴ�       }
        { ���������� ��� ����ȸ�� �ܿ�����Ʈ Ȯ��(GetBalance API)��           }
        { �̿��Ͻñ� �ٶ��ϴ�                                                  }
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
        { 1���� ���ڸ����� [����]�մϴ�. ���ڸ����� ������ ��쿡��        } 
        { ����������ȣ(mgtKey)�� ���� �� �� �ֽ��ϴ�.                        }
        { - ���������� ���� ���� : [�ӽ�����], [�������]                      }
        {**********************************************************************}

        try
                response := statementService.Delete(txtCorpNum.text, ItemCode,
                        tbMgtKey.Text);
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
        { ���ڸ����� ÷�������� ����մϴ�.                                  }
        { - ���ڸ����� ÷������ ����� [�ӽ�����] ���¿����� �����մϴ�.     }
        {   [���δ��], [����Ϸ�] ���¿����� ÷�������� ��� �� �� �����ϴ�.  }
        { - ÷�������� �ִ� 5������ �߰��� �� �ֽ��ϴ�.                        }
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
        { ���ڸ����� ÷�ε� ������ ����� Ȯ���մϴ�.                        }
        { - �����׸� �� ���Ͼ��̵�(AttachedFile)�� ���� ����(DeleteFile API)   }
        {   ȣ��� �̿��� �� �ֽ��ϴ�.                                         }
        {**********************************************************************}
        
        try
                filelist := statementService.GetFiles(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'SerialNum | DisplayName | AttachedFile | RegDT' + #13;
        
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

procedure TfrmExample.btnDeleteFileClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ���ڸ����� ÷�ε� ������ �����մϴ�.                               }
        { ���Ͼ��̵�� ���ϸ�� (GetFiles API)�� �����׸��� ���Ͼ��̵�         }
        { (AttachedFile) ���� Ȯ���Ͽ� DeleteFile API ȣ��� �����Ͻø� �˴ϴ�.}
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
        {**********************************************************************}
        { 1���� ���ڸ��� ����/��� ������ Ȯ���մϴ�.                        }
        { - ���ڸ��� ��������(GetInfo API) �����׸� ���� �ڼ��� ������     }
        {  "[���ڸ��� API �����Ŵ���] > 4.2. ���ڸ��� �������� ����"       }
        {  �� �����Ͻñ� �ٶ��ϴ�.                                             }
        {**********************************************************************}


        try
                statementInfo := statementService.getInfo(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | InvoiceNum | StateCode | TaxType | WriteDate | RegDT | OpenYN | OpenDT | SenderPrintYN | ReceiverPrintYN' + #13;

        tmp := tmp + statementInfo.ItemKey + ' | '
                   + statementInfo.InvoiceNum + ' | '
                   + IntToStr(statementInfo.StateCode) + ' | '
                   + statementInfo.TaxType + ' | '
                   + statementInfo.WriteDate + ' | '
                   + statementInfo.RegDT + ' | '
                   + BoolToStr(statementInfo.OpenYN) + ' | '
                   + statementInfo.OpenDT + ' | '
                   + BoolToStr(statementInfo.SenderPrintYN) + ' | '
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
        {**********************************************************************}
        { �ٷ��� ���ڸ��� ����/��� ������ Ȯ���մϴ�. (�ִ� 1000��)         }
        { - ���ڸ��� ��������(GetInfos API) �����׸� ���� �ڼ��� ������    }
        {  "[���ڸ��� API �����Ŵ���] > 4.2. ���ڸ��� �������� ����"       }
        {  �� �����Ͻñ� �ٶ��ϴ�.                                             }
        {**********************************************************************}


        //���ڸ��� ����������ȣ �迭, �ִ� 1000�Ǳ��� ���簡��
        SetLength(KeyList,4);
        KeyList[0] := '20161005-01';
        KeyList[1] := '20161005-02';
        KeyList[2] := '20161005-03';
        KeyList[3] := '20161005-04';
        
        try
                InfoList := statementService.getInfos(txtCorpNum.text, ItemCode, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | StateCode | TaxType | WriteDate | RegDT | SenderPrintYN | ReceiverPrintYN' + #13;
        
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].ItemKey + ' | '
                        + IntToStr(InfoList[i].StateCode) + ' | '
                        + InfoList[i].TaxType + ' | '
                        + InfoList[i].WriteDate + ' | '
                        + InfoList[i].RegDT + ' | '
                        + BoolToStr(InfoList[i].senderPrintYN) + ' | '
                        + BoolToStr(InfoList[i].receiverPrintYN) +  #13;
        end;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetLogsClick(Sender: TObject);
var
        LogList : TStatementLogList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ���ڸ��� ���� �����̷��� Ȯ���մϴ�.                               }
        { - ���� �����̷� Ȯ��(GetLogs API) �����׸� ���� �ڼ��� ������      }
        {  "[���ڸ��� API �����Ŵ���] > 3.3.4 ���� �����̷� Ȯ��" �� ����    }
        {   �Ͻñ� �ٶ��ϴ�.                                                   }
        {**********************************************************************}

        try
                LogList := statementService.getLogs(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'DocLogType | Log | ProcType | ProcMemo | RegDT | IP' + #13;
        
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
        { [����Ϸ�] ������ ���ڸ����� [���] �մϴ�.                        }
        { - [�������] ������ ���ڸ��� ����������ȣ�� ���� �ϱ� ���ؼ���   }
        {   ����(Delete API)�� ȣ���Ͽ� [����] ó�� �ϼž� �մϴ�.             }
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
        { [�ӽ�����] ������ ���ڸ����� [����]ó�� �մϴ�.                    }
        { - ����(Issue API)�� ȣ���ϴ� �������� ����Ʈ�� �����˴ϴ�.           }
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


procedure TfrmExample.btnReSendSMSClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        {**********************************************************************}
        { �˸����ڸ� �����մϴ�. (�ܹ�/SMS- �ѱ� �ִ� 45��)                    }
        { - �˸����� ���۽� ����Ʈ�� �����˴ϴ�. (���۽��н� ȯ��ó��)         }
        { - ���۳��� Ȯ���� "�˺� �α���" > [���� �ѽ�] > [���۳���] �ǿ���    }
        {   ���۰���� Ȯ���� �� �ֽ��ϴ�.                                     }
        {**********************************************************************}

        // �߽Ź�ȣ
        sendNum := '070-4304-2991';

        // ���Ź�ȣ
        receivenUm := '010-000-111';
        
        // �ȳ����� ����, 90byte �ʰ��ϴ� ��� ���̰� �����Ǿ� ���۵�.
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

procedure TfrmExample.btnReSendEmailClick(Sender: TObject);
var
        response : TResponse;
        email : String;
begin
        {**********************************************************************}
        { �����ڿ��� ���� �ȳ������� �������մϴ�.                             }
        {**********************************************************************}
        
        // ���� �����ּ�
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

procedure TfrmExample.btnSendInvoiceFaxClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { ���ڸ����� �ѽ������մϴ�.                                         }
        { - �ѽ� ���� ��û�� ����Ʈ�� �����˴ϴ�. (���۽��н� ȯ��ó��)        }
        { - ���۳��� Ȯ���� "�˺� �α���" > [���� �ѽ�] > [�ѽ�] > [���۳���]  }
        {   �޴����� ���۰���� Ȯ���� �� �ֽ��ϴ�.                            }
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



procedure TfrmExample.btnGetTaxinvoiceURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ���ڸ��� �ӽ�(����)������ �˾� URL�� ��ȯ�մϴ�.                   }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}

        try
                resultURL := statementService.GetURL(txtCorpNum.Text, 'TBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL2Click(Sender: TObject);
var
        resultURL : String;
begin

        {**********************************************************************}
        { ���ڸ��� ���๮���� �˾� URL�� ��ȯ�մϴ�.                         }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}
        
        try
                resultURL := statementService.GetURL(txtCorpNum.Text, 'SBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPopUpURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 1���� ���ڸ��� ���� �˾� URL�� ��ȯ�մϴ�.                         }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}

        try
                resultURL := statementService.getPopupURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 1���� ���ڸ��� �μ� �˾� URL�� ��ȯ�մϴ�.                         }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}
        
        try
                resultURL := statementService.getPrintURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetMailURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���ϸ�ũ URL�� ��ȯ�մϴ�.                                           }
        { - ���ϸ�ũ URL�� ��� ��ȿ�ð��� �������� �ʽ��ϴ�.                  }
        {**********************************************************************}

        try
                resultURL := statementService.getMailURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
       {**********************************************************************}
       { �ټ����� ���ڸ��� �μ� �˾� URL�� ��ȯ�մϴ�.                      }
       { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
       {**********************************************************************}

        // ���ڸ��� ����������ȣ �迭, �ִ� 100��
        SetLength(KeyList,2);
        KeyList[0] := '20161005-01';
        KeyList[1] := '20161005-02';

        try
                resultURL := statementService.getMassPrintURL(txtCorpNum.text, ItemCode, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        {**********************************************************************}
        { [�ӽ�����] ������ ���ڸ����� �����׸��� �����մϴ�.                }
        { - ���ڸ��� �׸� ������ "[���ڸ��� API �����Ŵ���] > 4.1.       }
        {   ���ڸ��� ����" �� �����Ͻñ� �ٶ��ϴ�.                           }
        {**********************************************************************}

        statement := TStatement.Create;
        
        statement.itemCode := ItemCode;
        statement.formCode := txtFormCode.Text;
        
         // ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        statement.itemCode := ItemCode;

        // �������ڵ�, �⺻��(����ó��)
        // ������ ������� �����ϰ��� �ϴ°�� ��ũ���� �����Ͽ� �ֽø�
        // �������� �����Ͽ� ����ڵ带 �߱��Ͽ� �帳�ϴ�.
        statement.formCode := txtFormCode.Text;

        // [�ʼ�] �ۼ�����
        statement.writeDate := '20161005';

        // [�ʼ�] {����, û��} �� ����
        statement.purposeType := '����';

        // [�ʼ�] {����, ����, �鼼} �� ����
        statement.taxType :='����';

        // ����� ������ �˸����� ���ۿ���
        statement.SMSSendYN := false;

        // ������ ���ξ��� ����ÿ� ���� ó������.
        statement.AutoAcceptYN := false;

        // ���ڸ��� ����������ȣ, 1~24�ڸ�, ����, ����, '-', '_' �������� ����
        // ����ں��� �ߺ����� �ʵ��� ����
        statement.MgtKey := tbMgtKey.Text;


        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // ������ ����ڹ�ȣ, '-'���� 10�ڸ�
        statement.senderCorpNum := '1234567890';

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderTaxRegID := '';

        // ������ ��ȣ
        statement.senderCorpName := '������ ��ȣ_����';

        // ������ ��ǥ�� ����
        statement.senderCEOName := '������ ��ǥ�� ����_����';

        // ������ �ּ�
        statement.senderAddr := '������ �ּ�_����';

        // ������ ����
        statement.senderBizClass := '������ ����_����';

        // ������ ���� 
        statement.senderBizType := '������ ����,����2';

        // ������ ����ڸ�
        statement.senderContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        statement.senderEmail := 'test@test.com';

        // ������ ����� ����ó 
        statement.senderTEL := '070-7070-0707';

        // ������ ����� �޴�����ȣ
        statement.senderHP := '010-000-2222';


        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // ���޹޴��� ����ڹ�ȣ, '-' ���� 10�ڸ� 
        statement.receiverCorpNum := '8888888888';

        // ���޹޴��� ��ȣ 
        statement.receiverCorpName := '���޹޴��� ��ȣ';

        //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.receiverTaxRegID := '';

        // ���޹޴��� ��ǥ�� ����
        statement.receiverCEOName := '���޹޴��� ��ǥ�� ����';

        // ���޹޴��� �ּ�
        statement.receiverAddr := '���޹޴��� �ּ�';

        // ���޹޴��� ����
        statement.receiverBizClass := '���޹޴��� ����';

        // ���޹޴��� ����
        statement.receiverBizType := '���޹޴��� ����';

        // ���޹޴��� ����ڸ�
        statement.receiverContactName := '���޹޴��� ����ڸ�';

        // ���޹޴��� ����� �����ּ�
        statement.receiverEmail := 'test@receiver.com';

        // ���޹޴��� ����� ����ó 
        statement.receiverTEL := '070-1234-1234';

        // ���޹޴��� ����� �޴�����ȣ
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
        {                        ���׸�(ǰ��) ����                           }
        { ���׸��� 0~99������ �ۼ��� �����ϸ�, �Ϸù�ȣ(serialNum)�� 1���� 99}
        { ���� ���������� �����Ͻñ� �ٶ��ϴ�.                                 }
        {**********************************************************************}

        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        statement.detailList[0].purchaseDT := '20161006';      //�ŷ�����
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
        statement.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        statement.detailList[1].purchaseDT := '20161006';      //�ŷ�����
        statement.detailList[1].itemName := 'ǰ���';
        statement.detailList[1].spec := '�԰�';
        statement.detailList[1].qty := '1';                    //����
        statement.detailList[1].unitCost := '100000';          //�ܰ�
        statement.detailList[1].supplyCost := '100000';        //���ް���
        statement.detailList[1].tax := '10000';                //����
        statement.detailList[1].remark := 'ǰ����';
        statement.detailList[1]._unit := '';                   //����
        statement.detailList[1].spare1 := '';
        statement.detailList[1].spare2 := '';
        statement.detailList[1].spare3 := '';
        statement.detailList[1].spare4 := '';
        statement.detailList[1].spare5 := '';

        //�߰��Ӽ��׸�, �ڼ��� ������ "[���ڸ��� api �����Ŵ���] > 5.2. �⺻��� �߰��Ӽ� ���̺�" ����
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
        { 1���� ���ڸ��� ���׸��� Ȯ���մϴ�.                              }
        { - ���ڸ��� �׸� ���� �ڼ��� ������ "[���ڸ���  API �����Ŵ���] }
        {   > 4.1 ���ڸ��� ���� " �� �����Ͻñ� �ٶ��ϴ�.                    }
        {**********************************************************************}

        try
                statement := statementService.getDetailInfo(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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

        tmp := tmp + '-----���׸�-----' + #13#13;

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

        tmp := tmp + '-----�߰��Ӽ�-----' + #13#13;

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
        {***********************************************************************}
        { ���ڸ����� ����ϱ��� ����������ȣ(mgtKey) �ߺ����θ� Ȯ���մϴ�.   }
        { - ������ȣ�� 1~24�ڸ� ����, ����, '-', '_' �������� �����Ҽ� �ֽ��ϴ�.}
        {***********************************************************************}
        
        try
                InUse := statementService.CheckMgtKeyInUse(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if InUse then ShowMessage('�����') else ShowMessage('�� �����.');
end;


procedure TfrmExample.Button1Click(Sender: TObject);
var
  resultURL : String;
begin
       {**********************************************************************}
       { 1���� ���ڸ��� �μ�(���޹޴���) URL�� ��ȯ�մϴ�.                  }
       { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
       {**********************************************************************}

        try
                resultURL := statementService.getEPrintURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ȸ������(JoinMember API)�� ȣ���ϱ� �� ���̵� �ߺ��� Ȯ���մϴ�.     }
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
        { ����ȸ���� ����ڸ� �űԷ� ����մϴ�.                               }
        {**********************************************************************}
        
        // [�ʼ�] ����� ���̵� (6�� �̻� 20�� �̸�)
        joinInfo.id := 'useid';
        
        // [�ʼ�] ��й�ȣ (6�� �̻� 20�� �̸�)
        joinInfo.pwd := 'thisispassword';

        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 30�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó
        joinInfo.tel := '070-4304-2991';

        // �޴�����ȣ
        joinInfo.hp := '010-1111-2222';

        // �ѽ���ȣ
        joinInfo.fax := '02-6442-9700';
        
        // [�ʼ�] �̸���
        joinInfo.email := 'test@test.com';

        // ȸ����ȸ ���ѿ���, true-ȸ����ȸ / false-������ȸ
        joinInfo.searchAllAllowYN := false;

        // ������ ���ѿ���
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
        { ����ȸ���� ����� ����� Ȯ���մϴ�.                                 }
        {**********************************************************************}

        try
                InfoList := statementService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        {**********************************************************************}
        { ����ȸ���� ����� ������ �����մϴ�.                                 }
        {**********************************************************************}
        
        contactInfo := TContactInfo.Create;

        // ����ڸ�
        contactInfo.personName := '�׽�Ʈ �����';

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ó
        contactInfo.tel := '070-4304-2991';

        // �޴�����ȣ
        contactInfo.hp := '010-000-1111';

        // �̸��� �ּ�
        contactInfo.email := 'test@test.com';
        
        // �ѽ���ȣ
        contactInfo.fax := '02-6442-9799';

        // ��ȸ����, true(ȸ����ȸ), false(������ȸ)
        contactInfo.searchAllAllowYN := true;

        // �����ڱ��� ��������
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
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.                                    }
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
        { ����ȸ���� ȸ�������� �����մϴ�.                                    }
        {**********************************************************************}
        
        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 30��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 70��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 40��
        corpInfo.bizType := '����';

        // ����, �ִ� 40��
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
        memo : String;
begin
        {**********************************************************************}
        { 1���� ���ڸ����� ��ù��� ó���մϴ�. (����)                       }
        { - ���ڸ��� �׸� ������ "[���ڸ��� API �����Ŵ���] >            }
        {   4.1. ���ڸ��� ����" �� �����Ͻñ� �ٶ��ϴ�.                      }
        {**********************************************************************}

        statement := TStatement.Create;

        // ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        statement.itemCode := ItemCode;

        // �������ڵ�, �⺻��(����ó��)
        // ������ ������� �����ϰ��� �ϴ°�� ��ũ���� �����Ͽ� �ֽø�
        // �������� �����Ͽ� ����ڵ带 �߱��Ͽ� �帳�ϴ�.
        statement.formCode := txtFormCode.Text;

        // [�ʼ�] �ۼ�����
        statement.writeDate := '20170222';

        // [�ʼ�] {����, û��} �� ����
        statement.purposeType := '����';

        // [�ʼ�] {����, ����, �鼼} �� ����
        statement.taxType :='����';

        // ����� ������ �˸����� ���ۿ���
        statement.SMSSendYN := false;

        // ������ ���ξ��� ����ÿ� ���� ó������.
        statement.AutoAcceptYN := false;

        // ���ڸ��� ����������ȣ, 1~24�ڸ�, ����, ����, '-', '_' �������� ����
        // ����ں��� �ߺ����� �ʵ��� ����
        statement.MgtKey := tbMgtKey.Text;


        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // ������ ����ڹ�ȣ, '-'���� 10�ڸ�
        statement.senderCorpNum := '1234567890';

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderTaxRegID := '';

        // ������ ��ȣ
        statement.senderCorpName := '������ ��ȣ';

        // ������ ��ǥ�� ����
        statement.senderCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        statement.senderAddr := '������ �ּ�';

        // ������ ����
        statement.senderBizClass := '������ ����';

        // ������ ���� 
        statement.senderBizType := '������ ����,����2';

        // ������ ����ڸ�
        statement.senderContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        statement.senderEmail := 'test@test.com';

        // ������ ����� ����ó 
        statement.senderTEL := '070-7070-0707';

        // ������ ����� �޴�����ȣ
        statement.senderHP := '010-000-2222';


        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // ���޹޴��� ����ڹ�ȣ, '-' ���� 10�ڸ� 
        statement.receiverCorpNum := '8888888888';

        // ���޹޴��� ��ȣ 
        statement.receiverCorpName := '���޹޴��� ��ȣ';

        //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.receiverTaxRegID := '';

        // ���޹޴��� ��ǥ�� ����
        statement.receiverCEOName := '���޹޴��� ��ǥ�� ����';

        // ���޹޴��� �ּ�
        statement.receiverAddr := '���޹޴��� �ּ�';

        // ���޹޴��� ����
        statement.receiverBizClass := '���޹޴��� ����';

        // ���޹޴��� ����
        statement.receiverBizType := '���޹޴��� ����';

        // ���޹޴��� ����ڸ�
        statement.receiverContactName := '���޹޴��� ����ڸ�';

        // ���޹޴��� ����� �����ּ�
        statement.receiverEmail := 'test@receiver.com';

        // ���޹޴��� ����� ����ó 
        statement.receiverTEL := '070-1234-1234';

        // ���޹޴��� ����� �޴�����ȣ
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
        { ���׸��� 0~99������ �ۼ��� �����ϸ�, �Ϸù�ȣ(serialNum)�� 1���� 99}
        { ���� ���������� �����Ͻñ� �ٶ��ϴ�.                                 }
        {**********************************************************************}

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
        statement.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        statement.detailList[1].purchaseDT := '20151211';      //�ŷ�����
        statement.detailList[1].itemName := 'ǰ���';
        statement.detailList[1].spec := '�԰�';
        statement.detailList[1].qty := '1';                    //����
        statement.detailList[1].unitCost := '100000';          //�ܰ�
        statement.detailList[1].supplyCost := '100000';        //���ް���
        statement.detailList[1].tax := '10000';                //����
        statement.detailList[1].remark := 'ǰ����';
        statement.detailList[1]._unit := '';                   //����
        statement.detailList[1].spare1 := '';
        statement.detailList[1].spare2 := '';
        statement.detailList[1].spare3 := '';
        statement.detailList[1].spare4 := '';
        statement.detailList[1].spare5 := '';

        
        {**********************************************************************}
        {                           �߰��Ӽ� �׸�                              }
        { - �߰��Ӽ� �׸� ���� �ڼ��� ������ "[���ڸ��� api �����Ŵ���] >  }
        {   5.2. �⺻��� �߰��Ӽ� ���̺�" �����Ͻñ� �ٶ��ϴ�.                }
        {**********************************************************************}
        
        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';
        statement.propertyBag[0].value := '�հ�';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';
        statement.propertyBag[2].value := '10000';

        memo := '��ù��� �޸�';
        
        try
                response := statementService.RegistIssue(txtCorpNum.text, statement, memo);
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

procedure TfrmExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.                               }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}
        
        try
                resultURL := statementService.getPopbillURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �ش� ������� ����ȸ�� ���Կ��θ� Ȯ���մϴ�.                        }
        { - LinkID�� ��Ʈ�ʸ� �ĺ��ϴ� ��������(32������)�� �����Ǿ� �ֽ��ϴ�. }
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
        { [���δ��], [����Ϸ�] ������ ���ڸ����� ���ó���մϴ�.           }
        { - [�������] ���ڸ����� ����������ȣ(mgtKey)�� ����(Delete API)��  }
        {   ȣ���Ͽ� [����] ���¿��� ���� �� �� �ֽ��ϴ�.                    } 
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
        { 1���� ���ڸ����� [����]�մϴ�. ���ڸ����� ������ ��쿡��        } 
        { ����������ȣ(mgtKey)�� ���� �� �� �ֽ��ϴ�.                        }
        { - ���������� ���� ���� : [�ӽ�����], [�������]                      }
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

procedure TfrmExample.btnIssueFaxClick(Sender: TObject);
var
        statement : TStatement;
        response : String;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { ���ڸ����� �ѽ��� �����մϴ�.                                      }
        { - �˺��� ���ڸ����� ��ϵ��� �ʰ� �ѽ��� ���۵˴ϴ�.               }
        { - ���۰���� [�˺�Ȩ������] > [����, �ѽ�] > [�ѽ� ���۳���] ����    }
        {   Ȯ���� �� �ֽ��ϴ�.                                                }
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
        // ������ ������� �����ϰ��� �ϴ°�� ��ũ���� �����Ͽ� �ֽø�
        // �������� �����Ͽ� ����ڵ带 �߱��Ͽ� �帳�ϴ�.
        statement.formCode := txtFormCode.Text;

        // [�ʼ�] �ۼ�����
        statement.writeDate := '20170222';

        // [�ʼ�] {����, û��} �� ����
        statement.purposeType := '����';

        // [�ʼ�] {����, ����, �鼼} �� ����
        statement.taxType :='����';

        // ����� ������ �˸����� ���ۿ���
        statement.SMSSendYN := false;

        // ������ ���ξ��� ����ÿ� ���� ó������.
        statement.AutoAcceptYN := true;

        // �ŷ����� ����������ȣ, 1~24�ڸ�, ����, ����, '-', '_' �������� ����
        // ����ں��� �ߺ����� �ʵ��� ����
        statement.MgtKey := tbMgtKey.Text;


        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // ������ ����ڹ�ȣ, '-'���� 10�ڸ�
        statement.senderCorpNum := '1234567890';

        // ������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.senderTaxRegID := '';

        // ������ ��ȣ
        statement.senderCorpName := '������ ��ȣ';

        // ������ ��ǥ�� ����
        statement.senderCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        statement.senderAddr := '������ �ּ�';

        // ������ ����
        statement.senderBizClass := '������ ����';

        // ������ ���� 
        statement.senderBizType := '������ ����,����2';

        // ������ ����ڸ�
        statement.senderContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        statement.senderEmail := 'test@test.com';

        // ������ ����� ����ó 
        statement.senderTEL := '070-7070-0707';

        // ������ ����� �޴�����ȣ
        statement.senderHP := '010-000-2222';


        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // ���޹޴��� ����ڹ�ȣ, '-' ���� 10�ڸ� 
        statement.receiverCorpNum := '8888888888';

        // ���޹޴��� ��ȣ 
        statement.receiverCorpName := '���޹޴��� ��ȣ';

        //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        statement.receiverTaxRegID := '';

        // ���޹޴��� ��ǥ�� ����
        statement.receiverCEOName := '���޹޴��� ��ǥ�� ����';

        // ���޹޴��� �ּ�
        statement.receiverAddr := '���޹޴��� �ּ�';

        // ���޹޴��� ����
        statement.receiverBizClass := '���޹޴��� ����';

        // ���޹޴��� ����
        statement.receiverBizType := '���޹޴��� ����';

        // ���޹޴��� ����ڸ�
        statement.receiverContactName := '���޹޴��� ����ڸ�';

        // ���޹޴��� ����� �����ּ�
        statement.receiverEmail := 'test@receiver.com';

        // ���޹޴��� ����� ����ó 
        statement.receiverTEL := '070-1234-1234';

        // ���޹޴��� ����� �޴�����ȣ
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
        { ���׸��� 0~99������ �ۼ��� �����ϸ�, �Ϸù�ȣ(serialNum)�� 1���� 99}
        { ���� ���������� �����Ͻñ� �ٶ��ϴ�.                                 }
        {**********************************************************************}
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
        statement.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        statement.detailList[1].purchaseDT := '20151211';      //�ŷ�����
        statement.detailList[1].itemName := 'ǰ���';
        statement.detailList[1].spec := '�԰�';
        statement.detailList[1].qty := '1';                    //����
        statement.detailList[1].unitCost := '100000';          //�ܰ�
        statement.detailList[1].supplyCost := '100000';        //���ް���
        statement.detailList[1].tax := '10000';                //����
        statement.detailList[1].remark := 'ǰ����';
        statement.detailList[1]._unit := '';                   //����
        statement.detailList[1].spare1 := '';
        statement.detailList[1].spare2 := '';
        statement.detailList[1].spare3 := '';
        statement.detailList[1].spare4 := '';
        statement.detailList[1].spare5 := '';

        {**********************************************************************}
        {                           �߰��Ӽ� �׸�                              }
        { - �߰��Ӽ� �׸� ���� �ڼ��� ������ "[���ڸ��� api �����Ŵ���] >  }
        {   5.2. �⺻��� �߰��Ӽ� ���̺�" �����Ͻñ� �ٶ��ϴ�.                }
        {**********************************************************************}

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
                response := statementService.FAXSend(txtCorpNum.text, statement, sendNum, receiveNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�ѽ�������ȣ(receiptNum) : '+ response);

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
        {**********************************************************************}
        { �˻����ǵ��� �̿��� ���ڸ��� ����� ��ȸ�մϴ�.                    }
        { - �����׸� ���� �ڼ��� ������ "[���ڸ��� API �����Ŵ���] >       }
        {   4.2. ���ڸ��� �������� ����" �� �����Ͻñ� �ٶ��ϴ�.             }
        {**********************************************************************}

        // [�ʼ�] �������� { R: �������, W:�ۼ�����, I:�������� }
        DType := 'W';

        // [�ʼ�] �˻� ��������, �ۼ�����(yyyyMMdd)
        SDate := '20160901';

        // [�ʼ�] �˻� ��������, �ۼ�����(yyyyMMdd)
        EDate := '20161031';

        // ���ۻ��°� �迭. �̱���� ��ü��ȸ, �������� �� 3�ڸ��� �迭, 2,3��° �ڸ� ���ϵ� ī�� ��밡��
        SetLength(StateList, 2);
        StateList[0] := '2**';
        StateList[1] := '3**';


        { �������� �ڵ�迭
         121 - �ŷ�����
         122 - û����
         123 - ������
         124 - ���ּ�
         125 - �Ա�ǥ
         126 - ������  }
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
            tmp := tmp + IntToStr(SearchList.list[i].ItemCode) + ' | '
                + SearchList.list[i].ItemKey + ' | '
                + IntToStr(SearchList.list[i].StateCode) + ' | '
                + SearchList.list[i].TaxType + ' | '
                + SearchList.list[i].WriteDate + ' | '
                + SearchList.list[i].SenderCorpName + ' | '
                + SearchList.list[i].SenderCorpNum + ' | '
                + SearchList.list[i].ReceiverCorpName + ' | '
                + SearchList.list[i].ReceiverCorpNum + ' | '
                + SearchList.list[i].SupplyCostTotal + ' | '
                + SearchList.list[i].TaxTotal + ' | '
                + SearchList.list[i].RegDT + ' | '
                + BoolToStr(SearchList.list[i].SenderPrintYN) + ' | '
                + BoolToStr(SearchList.list[i].receiverPrintYN) + ' | ' + #13;
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
        { �ٸ� ���ڸ����� ÷���մϴ�.                                        }
        {**********************************************************************}

        // ÷���� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubItemCode := 121;

        // ÷���� ���ڸ��� ����������ȣ
        SubMgtKey := '20151223-01';

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
        { ÷�ε� ���ڸ����� ÷�������մϴ�.                                  }
        {**********************************************************************}

        // ÷�������� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubItemCode := 121;

        // ÷�������� ���ڸ��� ����������ȣ
        SubMgtKey := '20151223-01';

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
        { ����ȸ���� ���ڸ��� API ���� ���������� Ȯ���մϴ�.              }
        { - ���ڸ��� �����ڵ�(ItemCode) �� ���������� Ȯ���� �� �ֽ��ϴ�.    }
        {**********************************************************************}


        try
                chargeInfo := statementService.GetChargeInfo(txtCorpNum.text, ItemCode);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetPopbillURL_SEALClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { �ΰ� �� ÷�ι��� ���  URL�� ��ȯ�մϴ�.                             }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}
                
        try
                resultURL := statementService.getPopbillURL(txtCorpNum.Text, 'SEAL');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ��Ʈ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.                                 }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}
        
        try
                resultURL := statementService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);

end;

end.
