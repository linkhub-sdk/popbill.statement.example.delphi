{******************************************************************************}
{ 팝빌 전자명세서 API Delphi SDK Example                                        }
{                                                                              }
{ - 델파이 SDK 적용방법 안내 : http://blog.linkhub.co.kr/572                   }
{ - 업데이트 일자 : 2017-08-30                                                 }
{ - 연동 기술지원 연락처 : 1600-8536 / 070-4304-2991                           }
{ - 연동 기술지원 이메일 : code@linkhub.co.kr                                  }
{                                                                              }
{ <테스트 연동개발 준비사항>                                                   }
{ (1) 32, 35번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를          }
{    링크허브 가입시 메일로 발급받은 인증정보로 수정                           }
{ (2) 팝빌 개발용 사이트(test.popbill.com)에 연동회원으로 가입                 }
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
        { - 인증정보(링크아이디, 비밀키)는 파트너의 연동회원을 식별하는        }
        {   인증에 사용되므로 유출되지 않도록 주의하시기 바랍니다              }
        { - 상업용 전환이후에도 인증정보는 변경되지 않습니다.                  }
        {**********************************************************************}
        
        //링크아이디.
        LinkID = 'TESTER';
        
        // 파트너 통신용 비밀키. 유출 주의.
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
        //전자명세서 모듈 초기화.
        statementService := TStatementService.Create(LinkID,SecretKey);

        //연동환경 설정값, true(개발용), false(상업용)
        statementService.IsTest := true;

        //Exception 처리 설정값, true(기본값)
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
        {    팝빌(www.popbill.com)에 로그인된 팝업 URL을 반환합니다.           }
        {    URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.      }
        {**********************************************************************}

        try
                resultURL := statementService.getPopbillURL(txtCorpNum.Text, txtUserID.Text, 'LOGIN');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        {    파트너의 연동회원으로 회원가입을 요청합니다.                      }
        {    아이디 중복확인은 btnCheckIDClick 프로시져를 참조하시기 바랍니다. }
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '1234567890';

        // 대표자성명, 최대 30자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 70자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 40자
        joinInfo.BizType := '업태';

        // 종목, 최대 40자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 20자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호, 6자이상 20자 미만
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // 담당자명, 최대 30자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 휴대폰번호, 최대 20자
        joinInfo.ContactHP := '010-000-1111';

        // 담당자 팩스번호, 최대 20자
        joinInfo.ContactFAX := '02-6442-9700';

        // 담당자 메일, 최대 70자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := statementService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);

end;

procedure TfrmExample.btnRegisterClick(Sender: TObject);
var
        statement : TStatement;
        response : TResponse;
begin
        statement := TStatement.Create;

        {**********************************************************************}
        { 전자명세서 1건을 [임시저장] 합니다.                                  }
        { - 전자명세서 임시저장(Register API) 호출후에는 발행(Issue API)을     }
        {   호출해야만 수신자에게 메일이 전송됩니다.                           }
        { - 임시저장과 발행을 한번의 호출로 처리하는 즉시발행(RegistIssue API) }
        {   프로세스를 권장합니다.                                             }
        { - 전자명세서 항목별 정보는 "[전자명세서 API 연동매뉴얼] >            }
        {   4.1. 전자명세서 구성" 을 참조하시기 바랍니다.                      }
        {**********************************************************************}

         // 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        statement.itemCode := ItemCode;

        // 맞춤양식코드, 기본값(공백처리)
        // 별도의 양식으로 전송하고자 하는경우 링크허브로 문의하여 주시면
        // 맞춤양식을 제작하여 양식코드를 발급하여 드립니다.
        statement.formCode := txtFormCode.Text;

        // [필수] 작성일자, 작성양식 yyyyMMdd
        statement.writeDate := '20170222';

        // [필수] {영수, 청구} 중 기재
        statement.purposeType := '영수';

        // [필수] {과세, 영세, 면세} 중 기재
        statement.taxType :='과세';

        // 발행시 수신자 알림문자 전송여부
        statement.SMSSendYN := false;

        // 수신자 승인없이 밸행시에 승인 처리여부.
        statement.AutoAcceptYN := false;

        // 전자명세서 문서관리번호, 1~24자리, 영문, 숫자, '-', '_' 조합으로 구성
        // 사업자별로 중복되지 않도록 구성
        statement.MgtKey := tbMgtKey.Text;


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // 공급자 사업자번호, '-'제외 10자리
        statement.senderCorpNum := '1234567890';

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderTaxRegID := '';

        // 공급자 상호
        statement.senderCorpName := '공급자 상호';

        // 공급자 대표자 성명
        statement.senderCEOName := '공급자 대표자 성명';

        // 공급자 주소
        statement.senderAddr := '공급자 주소';

        // 공급자 종목
        statement.senderBizClass := '공급자 종목';

        // 공급자 업태 
        statement.senderBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        statement.senderContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        statement.senderEmail := 'test@test.com';

        // 공급자 담당자 연락처 
        statement.senderTEL := '070-7070-0707';

        // 공급자 담당자 휴대폰번호
        statement.senderHP := '010-000-2222';


        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // 공급받는자 사업자번호, '-' 제외 10자리 
        statement.receiverCorpNum := '8888888888';

        // 공급받는자 상호 
        statement.receiverCorpName := '공급받는자 상호';

        //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.receiverTaxRegID := '';

        // 공급받는자 대표자 성명
        statement.receiverCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        statement.receiverAddr := '공급받는자 주소';

        // 공급받는자 종목
        statement.receiverBizClass := '공급받는자 업종';

        // 공급받는자 업태
        statement.receiverBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        statement.receiverContactName := '공급받는자 담당자명';

        // 공급받는자 담당자 메일주소
        statement.receiverEmail := 'test@receiver.com';

        // 공급받는자 담당자 연락처 
        statement.receiverTEL := '070-1234-1234';

        // 공급받는자 담당자 휴대폰번호
        statement.receiverHP := '010-111-222';

        
        //필수 공급가액 합계
        statement.supplyCostTotal := '200000';

        //필수 세액 합계
        statement.taxTotal := '20000';

        //필수 합계금액.  공급가액 + 세액
        statement.totalAmount := '220000';

        // 기재 상 일련번호
        statement.serialNum := '1';
        
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        // 사업자등록증 첨부여부
        statement.businessLicenseYN := false;

        // 통장사본 첨부여부
        statement.bankBookYN := false ;


        {**********************************************************************}
        {                     전자명세서 상세항목(품목) 정보                   }
        { 상세항목은 0~99개까지 작성이 가능하며, 일련번호(serialNum)은 1부터 99}
        { 까지 순차적으로 기재하시기 바랍니다.                                 }
        {**********************************************************************}

        //SetLength로 초기화 한후 기재.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20151211';      //거래일자
        statement.detailList[0].itemName := '품목명';
        statement.detailList[0].spec := '규격';
        statement.detailList[0].qty := '1';                    //수량
        statement.detailList[0].unitCost := '100000';          //단가
        statement.detailList[0].supplyCost := '100000';        //공급가액
        statement.detailList[0].tax := '10000';                //세액
        statement.detailList[0].remark := '품목비고';
        statement.detailList[0]._unit := '';                   //단위
        statement.detailList[0].spare1 := '';
        statement.detailList[0].spare2 := '';
        statement.detailList[0].spare3 := '';
        statement.detailList[0].spare4 := '';
        statement.detailList[0].spare5 := '';
        
        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //일련번호
        statement.detailList[1].purchaseDT := '20151211';      //거래일자
        statement.detailList[1].itemName := '품목명';
        statement.detailList[1].spec := '규격';
        statement.detailList[1].qty := '1';                    //수량
        statement.detailList[1].unitCost := '100000';          //단가
        statement.detailList[1].supplyCost := '100000';        //공급가액
        statement.detailList[1].tax := '10000';                //세액
        statement.detailList[1].remark := '품목비고';
        statement.detailList[1]._unit := '';                   //단위
        statement.detailList[1].spare1 := '';
        statement.detailList[1].spare2 := '';
        statement.detailList[1].spare3 := '';
        statement.detailList[1].spare4 := '';
        statement.detailList[1].spare5 := '';

        {**********************************************************************}
        {                           추가속성 항목                              }
        { - 추가속성 항목에 대한 자세한 사항은 "[전자명세서 api 연동매뉴얼] >  }
        {   5.2. 기본양식 추가속성 테이블" 참조하시기 바랍니다.                }
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
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다. 과금방식이 연동과금이 아닌       }
        { 파트너과금인 경우 파트너 잔여포인트 확인(GetPartnerBalance API) 기능 }
        { 이용하시기 바랍니다                                                  }
        {**********************************************************************}

        try
                balance := statementService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 전자명세서 종류별(ItemCode) 발행단가를 확인합니다.                   }
        { 121 - 거래명세서 / 122 - 청구서 / 123 - 견적서                       }
        { 124 - 발주서 / 125 - 입금표 / 126 - 영수증                           }
        {**********************************************************************}

        try
                unitcost := statementService.GetUnitCost(txtCorpNum.text, ItemCode);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage(cbItemCode.Text +' 발행단가 : '+ FloatToStr(unitcost));
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다. 과금방식이 파트너과금이 아닌       }
        { 연동과금인 경우 연동회원 잔여포인트 확인(GetBalance API)를           }
        { 이용하시기 바랍니다                                                  }
        {**********************************************************************}
        
        try
                balance := statementService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 1건의 전자명세서를 [삭제]합니다. 전자명세서가 삭제된 경우에만        } 
        { 문서관리번호(mgtKey)를 재사용 할 수 있습니다.                        }
        { - 삭제가능한 문서 상태 : [임시저장], [발행취소]                      }
        {**********************************************************************}

        try
                response := statementService.Delete(txtCorpNum.text, ItemCode,
                        tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnAttachFileClick(Sender: TObject);
var
        filePath : string;
        response : TResponse;
begin
        {**********************************************************************}
        { 전자명세서에 첨부파일을 등록합니다.                                  }
        { - 전자명세서의 첨부파일 등록은 [임시저장] 상태에서만 가능합니다.     }
        {   [승인대기], [발행완료] 상태에서는 첨부파일을 등록 할 수 없습니다.  }
        { - 첨부파일은 최대 5개까지 추가할 수 있습니다.                        }
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
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);

end;                                                 

procedure TfrmExample.btnGetFileListClick(Sender: TObject);
var
        fileList : TAttachedFileList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 전자명세서에 첨부된 파일의 목록을 확인합니다.                        }
        { - 응답항목 중 파일아이디(AttachedFile)는 파일 삭제(DeleteFile API)   }
        {   호출시 이용할 수 있습니다.                                         }
        {**********************************************************************}
        
        try
                filelist := statementService.GetFiles(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 전자명세서에 첨부된 파일을 삭제합니다.                               }
        { 파일아이디는 파일목록 (GetFiles API)의 응답항목중 파일아이디         }
        { (AttachedFile) 값을 확인하여 DeleteFile API 호출시 기재하시면 됩니다.}
        {**********************************************************************}

        try
                response := statementService.DeleteFile(txtCorpNum.text, ItemCode,
                                        tbMgtKey.Text, tbFileIndexID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
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
        { 1건의 전자명세서 상태/요약 정보를 확인합니다.                        }
        { - 전자명세서 상태정보(GetInfo API) 응답항목에 대한 자세한 정보는     }
        {  "[전자명세서 API 연동매뉴얼] > 4.2. 전자명세서 상태정보 구성"       }
        {  을 참조하시기 바랍니다.                                             }
        {**********************************************************************}


        try
                statementInfo := statementService.getInfo(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 다량의 전자명세서 상태/요약 정보를 확인합니다. (최대 1000건)         }
        { - 전자명세서 상태정보(GetInfos API) 응답항목에 대한 자세한 정보는    }
        {  "[전자명세서 API 연동매뉴얼] > 4.2. 전자명세서 상태정보 구성"       }
        {  을 참조하시기 바랍니다.                                             }
        {**********************************************************************}


        //전자명세서 문서관리번호 배열, 최대 1000건까지 기재가능
        SetLength(KeyList,4);
        KeyList[0] := '20161005-01';
        KeyList[1] := '20161005-02';
        KeyList[2] := '20161005-03';
        KeyList[3] := '20161005-04';
        
        try
                InfoList := statementService.getInfos(txtCorpNum.text, ItemCode, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 전자명세서 상태 변경이력을 확인합니다.                               }
        { - 상태 변경이력 확인(GetLogs API) 응답항목에 대한 자세한 정보는      }
        {  "[전자명세서 API 연동매뉴얼] > 3.3.4 상태 변경이력 확인" 을 참조    }
        {   하시기 바랍니다.                                                   }
        {**********************************************************************}

        try
                LogList := statementService.getLogs(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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


        if(cbItemCode.Text = '거래명세서') then ItemCode := 121;
        if(cbItemCode.Text = '청구서') then ItemCode := 122;
        if(cbItemCode.Text = '견적서') then ItemCode := 123;
        if(cbItemCode.Text = '발주서') then ItemCode := 124;
        if(cbItemCode.Text = '입금표') then ItemCode := 125;
        if(cbItemCode.Text = '영수증') then ItemCode := 126;

end;


procedure TfrmExample.btnCancel_IssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { [발행완료] 상태의 전자명세서를 [취소] 합니다.                        }
        { - [발행취소] 상태의 전자명세서 문서관리번호를 재사용 하기 위해서는   }
        {   삭제(Delete API)를 호출하여 [삭제] 처리 하셔야 합니다.             }
        {**********************************************************************}

        //메모
        memo := '발행취소 메모';

        try
                response := statementService.Cancel(txtCorpNum.text, ItemCode,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { [임시저장] 상태의 전자명세서를 [발행]처리 합니다.                    }
        { - 발행(Issue API)를 호출하는 시점에서 포인트가 차감됩니다.           }
        {**********************************************************************}

        // 메모
        memo := '발행 메모';

        try
                response := statementService.Issue(txtCorpNum.text, ItemCode,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;


procedure TfrmExample.btnReSendSMSClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        {**********************************************************************}
        { 알림문자를 전송합니다. (단문/SMS- 한글 최대 45자)                    }
        { - 알림문자 전송시 포인트가 차감됩니다. (전송실패시 환불처리)         }
        { - 전송내역 확인은 "팝빌 로그인" > [문자 팩스] > [전송내역] 탭에서    }
        {   전송결과를 확인할 수 있습니다.                                     }
        {**********************************************************************}

        // 발신번호
        sendNum := '070-4304-2991';

        // 수신번호
        receivenUm := '010-000-111';
        
        // 안내문자 내용, 90byte 초과하는 경우 길이가 조정되어 전송됨.
        contents := '거래명세서가 발행되었습니다. 메일 확인 바랍니다.';
        
        try
                response := statementService.SendSMS(txtCorpNum.text, ItemCode, tbMgtKey.Text,
                                        sendNum, receiveNum, contents);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnReSendEmailClick(Sender: TObject);
var
        response : TResponse;
        email : String;
begin
        {**********************************************************************}
        { 수신자에게 발행 안내메일을 재전송합니다.                             }
        {**********************************************************************}
        
        // 수신 메일주소
        email := 'test@test.com';

        try
                response := statementService.SendEmail(txtCorpNum.text, ItemCode,
                                                tbMgtKey.Text, email);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnSendInvoiceFaxClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { 전자명세서를 팩스전송합니다.                                         }
        { - 팩스 전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)        }
        { - 전송내역 확인은 "팝빌 로그인" > [문자 팩스] > [팩스] > [전송내역]  }
        {   메뉴에서 전송결과를 확인할 수 있습니다.                            }
        {**********************************************************************}
        
        // 팩스 발신번호
        sendNum := '080-1234-1234';

        // 팩스 수신번호
        receiveNum := '02-111-222';

        try
                response := statementService.SendFAX(txtCorpNum.text, ItemCode,
                                        tbMgtKey.Text, sendNum, receiveNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;



procedure TfrmExample.btnGetTaxinvoiceURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 전자명세서 임시(연동)문서함 팝업 URL을 반환합니다.                   }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}

        try
                resultURL := statementService.GetURL(txtCorpNum.Text, 'TBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 전자명세서 발행문서함 팝업 URL을 반환합니다.                         }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}
        
        try
                resultURL := statementService.GetURL(txtCorpNum.Text, 'SBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 1건의 전자명세서 보기 팝업 URL을 반환합니다.                         }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}

        try
                resultURL := statementService.getPopupURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 1건의 전자명세서 인쇄 팝업 URL을 반환합니다.                         }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}
        
        try
                resultURL := statementService.getPrintURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 메일링크 URL을 반환합니다.                                           }
        { - 메일링크 URL의 경우 유효시간이 존재하지 않습니다.                  }
        {**********************************************************************}

        try
                resultURL := statementService.getMailURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
       { 다수건의 전자명세서 인쇄 팝업 URL을 반환합니다.                      }
       { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
       {**********************************************************************}

        // 전자명세서 문서관리번호 배열, 최대 100건
        SetLength(KeyList,2);
        KeyList[0] := '20161005-01';
        KeyList[1] := '20161005-02';

        try
                resultURL := statementService.getMassPrintURL(txtCorpNum.text, ItemCode, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { [임시저장] 상태의 전자명세서의 기재항목을 수정합니다.                }
        { - 전자명세서 항목별 정보는 "[전자명세서 API 연동매뉴얼] > 4.1.       }
        {   전자명세서 구성" 을 참조하시기 바랍니다.                           }
        {**********************************************************************}

        statement := TStatement.Create;
        
        statement.itemCode := ItemCode;
        statement.formCode := txtFormCode.Text;
        
         // 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        statement.itemCode := ItemCode;

        // 맞춤양식코드, 기본값(공백처리)
        // 별도의 양식으로 전송하고자 하는경우 링크허브로 문의하여 주시면
        // 맞춤양식을 제작하여 양식코드를 발급하여 드립니다.
        statement.formCode := txtFormCode.Text;

        // [필수] 작성일자
        statement.writeDate := '20161005';

        // [필수] {영수, 청구} 중 기재
        statement.purposeType := '영수';

        // [필수] {과세, 영세, 면세} 중 기재
        statement.taxType :='과세';

        // 발행시 수신자 알림문자 전송여부
        statement.SMSSendYN := false;

        // 수신자 승인없이 밸행시에 승인 처리여부.
        statement.AutoAcceptYN := false;

        // 전자명세서 문서관리번호, 1~24자리, 영문, 숫자, '-', '_' 조합으로 구성
        // 사업자별로 중복되지 않도록 구성
        statement.MgtKey := tbMgtKey.Text;


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // 공급자 사업자번호, '-'제외 10자리
        statement.senderCorpNum := '1234567890';

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderTaxRegID := '';

        // 공급자 상호
        statement.senderCorpName := '공급자 상호_수정';

        // 공급자 대표자 성명
        statement.senderCEOName := '공급자 대표자 성명_수정';

        // 공급자 주소
        statement.senderAddr := '공급자 주소_수정';

        // 공급자 종목
        statement.senderBizClass := '공급자 종목_수정';

        // 공급자 업태 
        statement.senderBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        statement.senderContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        statement.senderEmail := 'test@test.com';

        // 공급자 담당자 연락처 
        statement.senderTEL := '070-7070-0707';

        // 공급자 담당자 휴대폰번호
        statement.senderHP := '010-000-2222';


        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // 공급받는자 사업자번호, '-' 제외 10자리 
        statement.receiverCorpNum := '8888888888';

        // 공급받는자 상호 
        statement.receiverCorpName := '공급받는자 상호';

        //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.receiverTaxRegID := '';

        // 공급받는자 대표자 성명
        statement.receiverCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        statement.receiverAddr := '공급받는자 주소';

        // 공급받는자 종목
        statement.receiverBizClass := '공급받는자 업종';

        // 공급받는자 업태
        statement.receiverBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        statement.receiverContactName := '공급받는자 담당자명';

        // 공급받는자 담당자 메일주소
        statement.receiverEmail := 'test@receiver.com';

        // 공급받는자 담당자 연락처 
        statement.receiverTEL := '070-1234-1234';

        // 공급받는자 담당자 휴대폰번호
        statement.receiverHP := '010-111-222';

        
        //필수 공급가액 합계
        statement.supplyCostTotal := '200000';

        //필수 세액 합계
        statement.taxTotal := '20000';

        //필수 합계금액.  공급가액 + 세액
        statement.totalAmount := '220000';

        // 기재 상 일련번호
        statement.serialNum := '1';
        
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        // 사업자등록증 첨부여부
        statement.businessLicenseYN := false;

        // 통장사본 첨부여부
        statement.bankBookYN := false ;

        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        { 상세항목은 0~99개까지 작성이 가능하며, 일련번호(serialNum)은 1부터 99}
        { 까지 순차적으로 기재하시기 바랍니다.                                 }
        {**********************************************************************}

        //SetLength로 초기화 한후 기재.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20161006';      //거래일자
        statement.detailList[0].itemName := '품목명';
        statement.detailList[0].spec := '규격';
        statement.detailList[0].qty := '1';                    //수량
        statement.detailList[0].unitCost := '100000';          //단가
        statement.detailList[0].supplyCost := '100000';        //공급가액
        statement.detailList[0].tax := '10000';                //세액
        statement.detailList[0].remark := '품목비고';
        statement.detailList[0]._unit := '';                   //단위
        statement.detailList[0].spare1 := '';
        statement.detailList[0].spare2 := '';
        statement.detailList[0].spare3 := '';
        statement.detailList[0].spare4 := '';
        statement.detailList[0].spare5 := '';
        
        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //일련번호
        statement.detailList[1].purchaseDT := '20161006';      //거래일자
        statement.detailList[1].itemName := '품목명';
        statement.detailList[1].spec := '규격';
        statement.detailList[1].qty := '1';                    //수량
        statement.detailList[1].unitCost := '100000';          //단가
        statement.detailList[1].supplyCost := '100000';        //공급가액
        statement.detailList[1].tax := '10000';                //세액
        statement.detailList[1].remark := '품목비고';
        statement.detailList[1]._unit := '';                   //단위
        statement.detailList[1].spare1 := '';
        statement.detailList[1].spare2 := '';
        statement.detailList[1].spare3 := '';
        statement.detailList[1].spare4 := '';
        statement.detailList[1].spare5 := '';

        //추가속성항목, 자세한 사항은 "[전자명세서 api 연동매뉴얼] > 5.2. 기본양식 추가속성 테이블" 참조
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
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;


procedure TfrmExample.btnGetDetailInfoClick(Sender: TObject);
var
        statement : TStatement;
        tmp : string;
        i : integer;
begin
        {**********************************************************************}
        { 1건의 전자명세서 상세항목을 확인합니다.                              }
        { - 전자명세서 항목에 대한 자세한 사항은 "[전자명세서  API 연동매뉴얼] }
        {   > 4.1 전자명세서 구성 " 을 참조하시기 바랍니다.                    }
        {**********************************************************************}

        try
                statement := statementService.getDetailInfo(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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

        tmp := tmp + '-----상세항목-----' + #13#13;

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

        tmp := tmp + '-----추가속성-----' + #13#13;

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
        { 전자명세서를 등록하기전 문서관리번호(mgtKey) 중복여부를 확인합니다.   }
        { - 관리번호는 1~24자리 숫자, 영문, '-', '_' 조합으로 구성할수 있습니다.}
        {***********************************************************************}
        
        try
                InUse := statementService.CheckMgtKeyInUse(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if InUse then ShowMessage('사용중') else ShowMessage('미 사용중.');
end;


procedure TfrmExample.Button1Click(Sender: TObject);
var
  resultURL : String;
begin
       {**********************************************************************}
       { 1건의 전자명세서 인쇄(공급받는자) URL을 반환합니다.                  }
       { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
       {**********************************************************************}

        try
                resultURL := statementService.getEPrintURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 회원가입(JoinMember API)을 호출하기 전 아이디 중복을 확인합니다.     }
        {**********************************************************************}
        
        try
                response := statementService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);

end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원의 담당자를 신규로 등록합니다.                               }
        {**********************************************************************}
        
        // [필수] 담당자 아이디 (6자 이상 20자 미만)
        joinInfo.id := 'useid';
        
        // [필수] 비밀번호 (6자 이상 20자 미만)
        joinInfo.pwd := 'thisispassword';

        // [필수] 담당자명(한글이나 영문 30자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처
        joinInfo.tel := '070-4304-2991';

        // 휴대폰번호
        joinInfo.hp := '010-1111-2222';

        // 팩스번호
        joinInfo.fax := '02-6442-9700';
        
        // [필수] 이메일
        joinInfo.email := 'test@test.com';

        // 회사조회 권한여부, true-회사조회 / false-개인조회
        joinInfo.searchAllAllowYN := false;

        // 관리자 권한여부
        joinInfo.mgrYN := false;

        try
                response := statementService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원의 담당자 목록을 확인합니다.                                 }
        {**********************************************************************}

        try
                InfoList := statementService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 연동회원의 담당자 정보를 수정합니다.                                 }
        {**********************************************************************}
        
        contactInfo := TContactInfo.Create;

        // 담당자명
        contactInfo.personName := '테스트 담당자';

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 연락처
        contactInfo.tel := '070-4304-2991';

        // 휴대폰번호
        contactInfo.hp := '010-000-1111';

        // 이메일 주소
        contactInfo.email := 'test@test.com';
        
        // 팩스번호
        contactInfo.fax := '02-6442-9799';

        // 조회권한, true(회사조회), false(개인조회)
        contactInfo.searchAllAllowYN := true;

        // 관리자권한 설정여부
        contactInfo.mgrYN := false; 

        try
                response := statementService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.                                    }
        {**********************************************************************}
        try
                corpInfo := statementService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (대표자 성명) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.                                    }
        {**********************************************************************}
        
        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 30자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 70자
        corpInfo.corpName := '상호';

        // 업태, 최대 40자
        corpInfo.bizType := '업태';

        // 종목, 최대 40자
        corpInfo.bizClass := '종목';

        // 주소, 최대 300자
        corpInfo.addr := '서울특별시 강남구 영동대로 517';

        try
                response := statementService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnRegistIssueClick(Sender: TObject);
var
        statement : TStatement;
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 1건의 전자명세서를 즉시발행 처리합니다. (권장)                       }
        { - 전자명세서 항목별 정보는 "[전자명세서 API 연동매뉴얼] >            }
        {   4.1. 전자명세서 구성" 을 참조하시기 바랍니다.                      }
        {**********************************************************************}

        statement := TStatement.Create;

        // 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        statement.itemCode := ItemCode;

        // 맞춤양식코드, 기본값(공백처리)
        // 별도의 양식으로 전송하고자 하는경우 링크허브로 문의하여 주시면
        // 맞춤양식을 제작하여 양식코드를 발급하여 드립니다.
        statement.formCode := txtFormCode.Text;

        // [필수] 작성일자
        statement.writeDate := '20170222';

        // [필수] {영수, 청구} 중 기재
        statement.purposeType := '영수';

        // [필수] {과세, 영세, 면세} 중 기재
        statement.taxType :='과세';

        // 발행시 수신자 알림문자 전송여부
        statement.SMSSendYN := false;

        // 수신자 승인없이 밸행시에 승인 처리여부.
        statement.AutoAcceptYN := false;

        // 전자명세서 문서관리번호, 1~24자리, 영문, 숫자, '-', '_' 조합으로 구성
        // 사업자별로 중복되지 않도록 구성
        statement.MgtKey := tbMgtKey.Text;


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // 공급자 사업자번호, '-'제외 10자리
        statement.senderCorpNum := '1234567890';

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderTaxRegID := '';

        // 공급자 상호
        statement.senderCorpName := '공급자 상호';

        // 공급자 대표자 성명
        statement.senderCEOName := '공급자 대표자 성명';

        // 공급자 주소
        statement.senderAddr := '공급자 주소';

        // 공급자 종목
        statement.senderBizClass := '공급자 종목';

        // 공급자 업태 
        statement.senderBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        statement.senderContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        statement.senderEmail := 'test@test.com';

        // 공급자 담당자 연락처 
        statement.senderTEL := '070-7070-0707';

        // 공급자 담당자 휴대폰번호
        statement.senderHP := '010-000-2222';


        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // 공급받는자 사업자번호, '-' 제외 10자리 
        statement.receiverCorpNum := '8888888888';

        // 공급받는자 상호 
        statement.receiverCorpName := '공급받는자 상호';

        //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.receiverTaxRegID := '';

        // 공급받는자 대표자 성명
        statement.receiverCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        statement.receiverAddr := '공급받는자 주소';

        // 공급받는자 종목
        statement.receiverBizClass := '공급받는자 업종';

        // 공급받는자 업태
        statement.receiverBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        statement.receiverContactName := '공급받는자 담당자명';

        // 공급받는자 담당자 메일주소
        statement.receiverEmail := 'test@receiver.com';

        // 공급받는자 담당자 연락처 
        statement.receiverTEL := '070-1234-1234';

        // 공급받는자 담당자 휴대폰번호
        statement.receiverHP := '010-111-222';

        
        //필수 공급가액 합계
        statement.supplyCostTotal := '200000';

        //필수 세액 합계
        statement.taxTotal := '20000';

        //필수 합계금액.  공급가액 + 세액
        statement.totalAmount := '220000';

        // 기재 상 일련번호
        statement.serialNum := '1';
        
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        // 사업자등록증 첨부여부
        statement.businessLicenseYN := false;

        // 통장사본 첨부여부
        statement.bankBookYN := false ;
        

        {**********************************************************************}
        {                     전자명세서 상세항목(품목) 정보                   }
        { 상세항목은 0~99개까지 작성이 가능하며, 일련번호(serialNum)은 1부터 99}
        { 까지 순차적으로 기재하시기 바랍니다.                                 }
        {**********************************************************************}

        //SetLength로 초기화 한후 기재.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20151211';      //거래일자
        statement.detailList[0].itemName := '품목명';
        statement.detailList[0].spec := '규격';
        statement.detailList[0].qty := '1';                    //수량
        statement.detailList[0].unitCost := '100000';          //단가
        statement.detailList[0].supplyCost := '100000';        //공급가액
        statement.detailList[0].tax := '10000';                //세액
        statement.detailList[0].remark := '품목비고';
        statement.detailList[0]._unit := '';                   //단위
        statement.detailList[0].spare1 := '';
        statement.detailList[0].spare2 := '';
        statement.detailList[0].spare3 := '';
        statement.detailList[0].spare4 := '';
        statement.detailList[0].spare5 := '';
        
        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //일련번호
        statement.detailList[1].purchaseDT := '20151211';      //거래일자
        statement.detailList[1].itemName := '품목명';
        statement.detailList[1].spec := '규격';
        statement.detailList[1].qty := '1';                    //수량
        statement.detailList[1].unitCost := '100000';          //단가
        statement.detailList[1].supplyCost := '100000';        //공급가액
        statement.detailList[1].tax := '10000';                //세액
        statement.detailList[1].remark := '품목비고';
        statement.detailList[1]._unit := '';                   //단위
        statement.detailList[1].spare1 := '';
        statement.detailList[1].spare2 := '';
        statement.detailList[1].spare3 := '';
        statement.detailList[1].spare4 := '';
        statement.detailList[1].spare5 := '';

        
        {**********************************************************************}
        {                           추가속성 항목                              }
        { - 추가속성 항목에 대한 자세한 사항은 "[전자명세서 api 연동매뉴얼] >  }
        {   5.2. 기본양식 추가속성 테이블" 참조하시기 바랍니다.                }
        {**********************************************************************}
        
        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';
        statement.propertyBag[0].value := '합계';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';
        statement.propertyBag[2].value := '10000';

        memo := '즉시발행 메모';
        
        try
                response := statementService.RegistIssue(txtCorpNum.text, statement, memo);
                statement.Free;
        except
                on le : EPopbillException do begin
                        statement.Free;
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전 URL을 반환합니다.                               }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}
        
        try
                resultURL := statementService.getPopbillURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 해당 사업자의 연동회원 가입여부를 확인합니다.                        }
        { - LinkID는 파트너를 식별하는 인증정보(32번라인)에 설정되어 있습니다. }
        {**********************************************************************}

        try
                response := statementService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnCancelClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { [승인대기], [발행완료] 상태의 전자명세서를 취소처리합니다.           }
        { - [발행취소] 전자명세서의 문서관리번호(mgtKey)는 삭제(Delete API)를  }
        {   호출하여 [삭제] 상태에서 재사용 할 수 있습니다.                    } 
        {**********************************************************************}

        // 메모
        memo := '발행취소 메모';
        
        try
                response := statementService.Cancel(txtCorpNum.text, ItemCode, tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnDelete_registIssueClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 1건의 전자명세서를 [삭제]합니다. 전자명세서가 삭제된 경우에만        } 
        { 문서관리번호(mgtKey)를 재사용 할 수 있습니다.                        }
        { - 삭제가능한 문서 상태 : [임시저장], [발행취소]                      }
        {**********************************************************************}

        try
                response := statementService.Delete(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnIssueFaxClick(Sender: TObject);
var
        statement : TStatement;
        response : String;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { 전자명세서를 팩스로 전송합니다.                                      }
        { - 팝빌에 전자명세서가 등록되지 않고 팩스로 전송됩니다.               }
        { - 전송결과는 [팝빌홈페이지] > [문자, 팩스] > [팩스 전송내역] 에서    }
        {   확인할 수 있습니다.                                                }
        {**********************************************************************}

        // 발신번호
        sendNum := '070-4304-2991';

        // 수신팩스번호
        receiveNum := '02-000-111';


        // 전자명세서 객체 초기화
        statement := TStatement.Create;

        // 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        statement.itemCode := ItemCode;

        // 맞춤양식코드, 기본값(공백처리)
        // 별도의 양식으로 전송하고자 하는경우 링크허브로 문의하여 주시면
        // 맞춤양식을 제작하여 양식코드를 발급하여 드립니다.
        statement.formCode := txtFormCode.Text;

        // [필수] 작성일자
        statement.writeDate := '20170222';

        // [필수] {영수, 청구} 중 기재
        statement.purposeType := '영수';

        // [필수] {과세, 영세, 면세} 중 기재
        statement.taxType :='과세';

        // 발행시 수신자 알림문자 전송여부
        statement.SMSSendYN := false;

        // 수신자 승인없이 밸행시에 승인 처리여부.
        statement.AutoAcceptYN := true;

        // 거래명세서 문서관리번호, 1~24자리, 영문, 숫자, '-', '_' 조합으로 구성
        // 사업자별로 중복되지 않도록 구성
        statement.MgtKey := tbMgtKey.Text;


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // 공급자 사업자번호, '-'제외 10자리
        statement.senderCorpNum := '1234567890';

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderTaxRegID := '';

        // 공급자 상호
        statement.senderCorpName := '공급자 상호';

        // 공급자 대표자 성명
        statement.senderCEOName := '공급자 대표자 성명';

        // 공급자 주소
        statement.senderAddr := '공급자 주소';

        // 공급자 종목
        statement.senderBizClass := '공급자 종목';

        // 공급자 업태 
        statement.senderBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        statement.senderContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        statement.senderEmail := 'test@test.com';

        // 공급자 담당자 연락처 
        statement.senderTEL := '070-7070-0707';

        // 공급자 담당자 휴대폰번호
        statement.senderHP := '010-000-2222';


        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // 공급받는자 사업자번호, '-' 제외 10자리 
        statement.receiverCorpNum := '8888888888';

        // 공급받는자 상호 
        statement.receiverCorpName := '공급받는자 상호';

        //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.receiverTaxRegID := '';

        // 공급받는자 대표자 성명
        statement.receiverCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        statement.receiverAddr := '공급받는자 주소';

        // 공급받는자 종목
        statement.receiverBizClass := '공급받는자 업종';

        // 공급받는자 업태
        statement.receiverBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        statement.receiverContactName := '공급받는자 담당자명';

        // 공급받는자 담당자 메일주소
        statement.receiverEmail := 'test@receiver.com';

        // 공급받는자 담당자 연락처 
        statement.receiverTEL := '070-1234-1234';

        // 공급받는자 담당자 휴대폰번호
        statement.receiverHP := '010-111-222';

        
        //필수 공급가액 합계
        statement.supplyCostTotal := '200000';

        //필수 세액 합계
        statement.taxTotal := '20000';

        //필수 합계금액.  공급가액 + 세액
        statement.totalAmount := '220000';

        // 기재 상 일련번호
        statement.serialNum := '1';
        
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        // 사업자등록증 첨부여부
        statement.businessLicenseYN := false;

        // 통장사본 첨부여부
        statement.bankBookYN := false ;

        {**********************************************************************}
        {                     전자명세서 상세항목(품목) 정보                   }
        { 상세항목은 0~99개까지 작성이 가능하며, 일련번호(serialNum)은 1부터 99}
        { 까지 순차적으로 기재하시기 바랍니다.                                 }
        {**********************************************************************}
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20151211';      //거래일자
        statement.detailList[0].itemName := '품목명';
        statement.detailList[0].spec := '규격';
        statement.detailList[0].qty := '1';                    //수량
        statement.detailList[0].unitCost := '100000';          //단가
        statement.detailList[0].supplyCost := '100000';        //공급가액
        statement.detailList[0].tax := '10000';                //세액
        statement.detailList[0].remark := '품목비고';
        statement.detailList[0]._unit := '';                   //단위
        statement.detailList[0].spare1 := '';
        statement.detailList[0].spare2 := '';
        statement.detailList[0].spare3 := '';
        statement.detailList[0].spare4 := '';
        statement.detailList[0].spare5 := '';
        
        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //일련번호
        statement.detailList[1].purchaseDT := '20151211';      //거래일자
        statement.detailList[1].itemName := '품목명';
        statement.detailList[1].spec := '규격';
        statement.detailList[1].qty := '1';                    //수량
        statement.detailList[1].unitCost := '100000';          //단가
        statement.detailList[1].supplyCost := '100000';        //공급가액
        statement.detailList[1].tax := '10000';                //세액
        statement.detailList[1].remark := '품목비고';
        statement.detailList[1]._unit := '';                   //단위
        statement.detailList[1].spare1 := '';
        statement.detailList[1].spare2 := '';
        statement.detailList[1].spare3 := '';
        statement.detailList[1].spare4 := '';
        statement.detailList[1].spare5 := '';

        {**********************************************************************}
        {                           추가속성 항목                              }
        { - 추가속성 항목에 대한 자세한 사항은 "[전자명세서 api 연동매뉴얼] >  }
        {   5.2. 기본양식 추가속성 테이블" 참조하시기 바랍니다.                }
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
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('팩스접수번호(receiptNum) : '+ response);

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
        { 검색조건들을 이용해 전자명세서 목록을 조회합니다.                    }
        { - 응답항목에 대한 자세한 사항은 "[전자명세서 API 연동매뉴얼] >       }
        {   4.2. 전자명세서 상태정보 구성" 을 참조하시기 바랍니다.             }
        {**********************************************************************}

        // [필수] 일자유형 { R: 등록일자, W:작성일자, I:발행일자 }
        DType := 'W';

        // [필수] 검색 시작일자, 작성형태(yyyyMMdd)
        SDate := '20160901';

        // [필수] 검색 종료일자, 작성형태(yyyyMMdd)
        EDate := '20161031';

        // 전송상태값 배열. 미기재시 전체조회, 문서상태 값 3자리의 배열, 2,3번째 자리 와일드 카드 사용가능
        SetLength(StateList, 2);
        StateList[0] := '2**';
        StateList[1] := '3**';


        { 문서종류 코드배열
         121 - 거래명세서
         122 - 청구서
         123 - 견적서
         124 - 발주서
         125 - 입금표
         126 - 영수증  }
        SetLength(ItemCodeList, 6);
        ItemCodeList[0] := 121;
        ItemCodeList[1] := 122;
        ItemCodeList[2] := 123;
        ItemCodeList[3] := 124;
        ItemCodeList[4] := 125;
        ItemCodeList[5] := 126;         

        // 거래처 정보, 거래처 상호 또는 거래처 사업자등록번호 기재, 미기재시 전체조회
        QString := '';

        // 페이지 번호, 기본값 1
        Page := 1;

        // 페이지당 검색갯수, 기본값 500, 최대 1000
        PerPage := 30;

        // 정렬방향, 'D' : 내림차순 , 'A' : 오름차순
        Order := 'D';

        try
                SearchList := statementService.Search(txtCorpNum.text,DType, SDate,
                                EDate, StateList, ItemCodeList, QString, Page, PerPage, Order);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 다른 전자명세서를 첨부합니다.                                        }
        {**********************************************************************}

        // 첨부할 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        SubItemCode := 121;

        // 첨부할 전자명세서 문서관리번호
        SubMgtKey := '20151223-01';

        try
                response := statementService.AttachStatement(txtCorpNum.text, ItemCode, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);


end;

procedure TfrmExample.btnDetachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {**********************************************************************}
        { 첨부된 전자명세서를 첨부해제합니다.                                  }
        {**********************************************************************}

        // 첨부해제할 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        SubItemCode := 121;

        // 첨부해제할 전자명세서 문서관리번호
        SubMgtKey := '20151223-01';

        try
                response := statementService.DetachStatement(txtCorpNum.text, ItemCode, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);


end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TStatementChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 연동회원의 전자명세서 API 서비스 과금정보를 확인합니다.              }
        { - 전자명세서 종류코드(ItemCode) 별 과금정보를 확인할 수 있습니다.    }
        {**********************************************************************}


        try
                chargeInfo := statementService.GetChargeInfo(txtCorpNum.text, ItemCode);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetPopbillURL_SEALClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 인감 및 첨부문서 등록  URL을 반환합니다.                             }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}
                
        try
                resultURL := statementService.getPopbillURL(txtCorpNum.Text, 'SEAL');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
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
        { 파트너 포인트 충전 URL을 반환합니다.                                 }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}
        
        try
                resultURL := statementService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);

end;

end.
