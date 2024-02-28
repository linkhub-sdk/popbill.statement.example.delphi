{******************************************************************************}
{
{ 팝빌 전자명세서 API Delphi SDK Example
{ Delphi 연동 튜토리얼 안내 : https://developers.popbill.com/guide/statement/java/getting-started/tutorial?fwn=jsp
{
{ 업데이트 일자 : 2024-02-27
{ 연동기술지원 연락처 : 1600-9854
{ 연동기술지원 이메일 : code@linkhubcorp.com
{
{ <테스트 연동개발 준비사항>
{ 1) API Key 변경 (연동신청 시 메일로 전달된 정보)
{    - LinkID : 링크허브에서 발급한 링크아이디
{    - SecretKey : 링크허브에서 발급한 비밀키
{ 2) SDK 환경설정 옵션 설정
{    - IsTest : 연동환경 설정, true-테스트, false-운영(Production), (기본값:true)
{    - IsThrowException : 예외 처리 설정, true-사용, false-미사용, (기본값:true)
{    - IPRestrictOnOff : 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true)
{    - UseLocalTimeYN : 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true)정
{                                                                              
{******************************************************************************}
unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillStatement, ExtCtrls;

const

        // 링크아이디
        LinkID = 'TESTER';

        // 비밀키
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
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    txtURL: TEdit;
    Label8: TLabel;
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
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);
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
        // 전자명세서 모듈 초기화.
        statementService := TStatementService.Create(LinkID,SecretKey);

        // 연동환경 설정, true-테스트, false-운영(Production), (기본값:true)
        statementService.IsTest := true;

        // 예외 처리 설정, true-사용, false-미사용, (기본값:true)
        statementService.IsThrowException := true;

        // 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true)
        statementService.IPRestrictOnOff := true;

        // 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true)
        statementService.UseLocalTimeYN := false;
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
        { 팝빌 사이트에 로그인 상태로 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/member#GetAccessURL
        {**********************************************************************}
        try
                resultURL := statementService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { 사용자를 연동회원으로 가입처리합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/member#JoinMember
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '4364364364';

        // 대표자성명, 최대 100자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 200자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 100자
        joinInfo.BizType := '업태';

        // 종목, 최대 100자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 50자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // 담당자명, 최대 100자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 메일, 최대 100자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := statementService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnRegisterClick(Sender: TObject);
var
        statement : TStatement;
        response : TResponse;
begin
        statement := TStatement.Create;
        {**********************************************************************}
        { 작성된 전자명세서 데이터를 팝빌에 저장합니다.
        { - "임시저장" 상태의 전자명세서는 발행(Issue API) 함수를 호출하여 "발행완료"처리한 경우에만 수신자에게 발행 안내 메일이 발송됩니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/issue#Register
        {**********************************************************************}

         // 전자명세서 문서종류코드, 121-거래명세서, 122-청구서, 123-견적서, 124-발주서, 125-입금표, 126-영수증
        statement.itemCode := ItemCode;

        // 맞춤양식코드, 기본값(공백처리)
        // 별도의 양식으로 전송하고자 하는경우 파트너센터(1600-8536)로 문의주시기 바랍니다.
        statement.formCode := txtFormCode.Text;

        // [필수] 작성일자, 작성양식 yyyyMMdd
        statement.writeDate := '20220101';

        // [필수] {영수, 청구, 없음} 중 기재
        statement.purposeType := '영수';

        // [필수] {과세, 영세, 면세} 중 기재
        statement.taxType :='과세';

        // 발행시 수신자 알림문자 전송여부
        statement.SMSSendYN := false;


        // 전자명세서 문서번호, 1~24자리, 영문, 숫자, '-', '_' 조합으로 구성
        // 사업자별로 중복되지 않도록 구성
        statement.MgtKey := tbMgtKey.Text;

        {**********************************************************************}
        {                             발신자 정보                              }
        {**********************************************************************}

        // 발신자 사업자번호, '-'제외 10자리
        statement.senderCorpNum := txtCorpNum.Text;

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderTaxRegID := '';

        // 발신자 상호
        statement.senderCorpName := '발신자 상호';

        // 발신자 대표자 성명
        statement.senderCEOName := '발신자 대표자 성명';

        // 발신자 주소
        statement.senderAddr := '발신자 주소';

        // 발신자 종목
        statement.senderBizClass := '발신자 종목';

        // 발신자 업태
        statement.senderBizType := '발신자 업태,업태2';

        // 발신자 담당자명
        statement.senderContactName := '발신자 담당자명';

        // 발신자 담당자 메일주소
        statement.senderEmail := 'test@test.com';

        // 발신자 담당자 연락처
        statement.senderTEL := '070-7070-0707';

        // 발신자 담당자 휴대폰번호
        statement.senderHP := '010-000-2222';

        // 발신자 담당자 팩스
        statement.senderFAX := '070-000-111';

        {**********************************************************************}
        {                            수신자 정보                               }
        {**********************************************************************}

        // 수신자 사업자번호, '-' 제외 10자리
        statement.receiverCorpNum := '8888888888';

        // 수신자 상호
        statement.receiverCorpName := '수신자 상호';

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.receiverTaxRegID := '';

        // 수신자 대표자 성명
        statement.receiverCEOName := '수신자 대표자 성명';

        // 수신자 주소
        statement.receiverAddr := '수신자 주소';

        // 수신자 종목
        statement.receiverBizClass := '수신자 업종';

        // 수신자 업태
        statement.receiverBizType := '수신자 업태';

        // 수신자 담당자명
        statement.receiverContactName := '수신자 담당자명';

        // 수신자 담당자 메일주소
        statement.receiverEmail := 'test@receiver.com';

        // 수신자 담당자 연락처
        statement.receiverTEL := '070-1234-1234';

        // 수신자 담당자 휴대폰번호
        statement.receiverHP := '010-111-222';

        // 수신자 담당자 팩스
        statement.receiverFAX := '070-000-111';


        //[필수] 공급가액 합계
        statement.supplyCostTotal := '200000';

        //[필수] 세액 합계
        statement.taxTotal := '20000';

        //[필수] 합계금액. 공급가액 + 세액
        statement.totalAmount := '220000';

        // 기재 상 일련번호
        statement.serialNum := '1';

        // 비고
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        // 사업자등록증 첨부여부
        statement.businessLicenseYN := false;

        // 통장사본 첨부여부
        statement.bankBookYN := false ;

        {**********************************************************************}
        {                     전자명세서 상세항목(품목) 정보                   }
        { 일련번호(serialNum)은 1부터 순차적으로 기재하시기 바랍니다.          }
        {**********************************************************************}

        //SetLength로 초기화 한후 기재.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20220101';      //거래일자
        statement.detailList[0].itemName := '품목명';          //품목명
        statement.detailList[0].spec := '규격';                //규격
        statement.detailList[0].qty := '1';                    //수량
        statement.detailList[0].unitCost := '100000';          //단가
        statement.detailList[0].supplyCost := '100000';        //공급가액
        statement.detailList[0].tax := '10000';                //세액
        statement.detailList[0].remark := '품목비고';          //비고
        statement.detailList[0].spare1 := '여분1';             //여분1
        statement.detailList[0].spare2 := '여분2';             //여분2
        statement.detailList[0].spare3 := '여분3';             //여분3
        statement.detailList[0].spare4 := '여분4';             //여분4
        statement.detailList[0].spare5 := '여분5';             //여분5

        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //일련번호
        statement.detailList[1].purchaseDT := '20220101';      //거래일자
        statement.detailList[1].itemName := '품목명';          //품목명
        statement.detailList[1].spec := '규격';                //규격
        statement.detailList[1].qty := '1';                    //수량
        statement.detailList[1].unitCost := '100000';          //단가
        statement.detailList[1].supplyCost := '100000';        //공급가액
        statement.detailList[1].tax := '10000';                //세액
        statement.detailList[1].remark := '품목비고';          //비고
        statement.detailList[1].spare1 := '여분1';             //여분1
        statement.detailList[1].spare2 := '여분2';             //여분2
        statement.detailList[1].spare3 := '여분3';             //여분3
        statement.detailList[1].spare4 := '여분4';             //여분4
        statement.detailList[1].spare5 := '여분5';             //여분5

        {**********************************************************************}
        {                           추가속성 항목                              }
        { -추가속성에 관한 자세한 사항은 아래의 URL을 참조.                     }
        { - https://developers.popbill.com/guide/statement/delphi/introduction/statement-form#propertybag-table         }
        {**********************************************************************}

        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';     //전잔액
        statement.propertyBag[0].value := '30000';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';    //현금액
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';    //현잔액
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
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/point#GetBalance
        {**********************************************************************}

        try
                balance := statementService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
        end;
end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 전자명세서 발행시 과금되는 포인트 단가를 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/point#GetUnitCost                          
        {**********************************************************************}
        try
                unitcost := statementService.GetUnitCost(txtCorpNum.text, ItemCode);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage(cbItemCode.Text +' 발행단가 : '+ FloatToStr(unitcost));
        end;
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/point#GetPartnerBalance
        {**********************************************************************}
        
        try
                balance := statementService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 삭제 가능한 상태의 전자명세서를 삭제합니다.
        { - 삭제 가능한 상태: "임시저장", "취소", "승인거부", "발행취소"
        { - 전자명세서를 삭제하면 사용된 문서번호(mgtKey)를 재사용할 수 있습니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/issue#Delete
        {**********************************************************************}

        try
                response := statementService.Delete(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnAttachFileClick(Sender: TObject);
var
        filePath : string;
        response : TResponse;
begin
        {**********************************************************************}
        { "임시저장" 상태의 명세서에 1개의 파일을 첨부합니다. (최대 5개)
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#AttachFile
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
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;                                                 

procedure TfrmExample.btnGetFileListClick(Sender: TObject);
var
        fileList : TAttachedFileList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 전자명세서에 첨부된 파일목록을 확인합니다.
        { - 응답항목 중 파일아이디(AttachedFile) 항목은 첨부파일 삭제(DeleteFile API) 함수 호출 시 이용할 수 있습니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#GetFiles
        {**********************************************************************}
        
        try
                filelist := statementService.GetFiles(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                tmp := 'SerialNum(첨부파일 일련번호) | DisplayName(첨부파일명) | AttachedFile(파일아이디) | RegDT(첨부일시)' + #13;

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
        { "임시저장" 상태의 전자명세서에 첨부된 1개의 파일을 삭제합니다.
        { - 파일 식별을 위해 첨부 시 부여되는 'FileID'는 첨부파일 목록 확인(GetFiles API) 함수를 호출하여 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#DeleteFile
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

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;



procedure TfrmExample.btnGetInfoClick(Sender: TObject);
var
        statementInfo : TStatementInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 전자명세서의 1건의 상태 및 요약정보 확인합니다.                      
        { - https://developers.popbill.com/reference/statement/delphi/api/info#GetInfo
        {**********************************************************************}

        try
                statementInfo := statementService.getInfo(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
                exit;
        end
        else
        begin        
                tmp := tmp + 'itemCode(문서종류코드) :' + IntToStr(statementInfo.itemCode) + #13;
                tmp := tmp + 'itemKey(팝빌번호) :' + statementInfo.itemKey + #13;
                tmp := tmp + 'invoiceNum(문서고유번호) :' + statementInfo.invoiceNum + #13;
                tmp := tmp + 'mgtKey(문서번호) :' + statementInfo.mgtKey + #13;
                tmp := tmp + 'taxType(세금형태) :' + statementInfo.taxType + #13;
                tmp := tmp + 'writeDate(작성일자) :' + statementInfo.writeDate + #13;
                tmp := tmp + 'regDT(임시저장일시) :' + statementInfo.regDT + #13;
                tmp := tmp + 'senderCorpName(발신자 상호) :' + statementInfo.senderCorpName + #13;
                tmp := tmp + 'senderCorpNum(발신자 사업자번호) :' + statementInfo.senderCorpNum + #13;
                tmp := tmp + 'senderPrintYN(발신자 인쇄여부) :' + BoolToStr(statementInfo.senderPrintYN) + #13;
                tmp := tmp + 'receiverCorpName(수신자 상호) :' + statementInfo.receiverCorpName + #13;
                tmp := tmp + 'receiverCorpNum(수신자 사업자번호) :' + statementInfo.receiverCorpNum + #13;
                tmp := tmp + 'receiverPrintYN(수신자 인쇄여부) :' + BoolToStr(statementInfo.receiverPrintYN) + #13;
                tmp := tmp + 'supplyCostTotal(공급가액 합계) :' + statementInfo.supplyCostTotal + #13;
                tmp := tmp + 'taxTotal(세액 합계) :' + statementInfo.taxTotal + #13;
                tmp := tmp + 'purposeType(영수/청구) :' + statementInfo.purposeType + #13;
                tmp := tmp + 'issueDT(발행일시) :' + statementInfo.issueDT + #13;
                tmp := tmp + 'stateCode(상태코드) :' + IntToStr(statementInfo.stateCode) + #13;
                tmp := tmp + 'stateDT(상태 변경일시) :' + statementInfo.stateDT + #13;
                tmp := tmp + 'stateMemo(상태메모) :' + statementInfo.stateMemo + #13;
                tmp := tmp + 'openYN(개봉 여부) :' + BoolToStr(statementInfo.openYN) + #13;
                tmp := tmp + 'openDT(개봉 일시) :' + statementInfo.openDT;
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
        { 다수건의 전자명세서 상태 및 요약 정보를 확인합니다. (1회 호출 시 최대 1,000건 확인 가능)     
        { - https://developers.popbill.com/reference/statement/delphi/api/info#GetInfos
        {**********************************************************************}

        //전자명세서 문서번호 배열 (최대 1000건)
        SetLength(KeyList,4);
        KeyList[0] := '20220101-01';
        KeyList[1] := '20220101-02';
        KeyList[2] := '20220101-03';
        KeyList[3] := '20220101-04';

        try
                InfoList := statementService.getInfos(txtCorpNum.text, ItemCode, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := 'itemCode(문서종류코드) | itemKey(팝빌번호) | invoiceNum(문서고유번호) | mgtKey(문서번호) | taxType(세금형태) | ';
                tmp := tmp + 'writeDate(작성일자) | regDT(임시저장일시) | senderCorpName(발신자 상호) | senderCorpNum(발신자 사업자번호) | ' ;
                tmp := tmp + 'senderPrintYN(발신자 인쇄여부) | receiverCorpName(수신자 상호) | receiverCorpNum(수신자 사업자번호) | ';
                tmp := tmp + 'receiverPrintYN(수신자 인쇄여부) | supplyCostTotal(공급가액 합계) | taxTotal(세액 합계) | purposeType(영수/청구) | ';
                tmp := tmp + 'issueDT(발행일시) | stateCode(상태코드) | stateDT(상태 변경일시) | stateMemo(상태메모) | ';
                tmp := tmp + 'openYN(개봉 여부) | openDT(개봉 일시)' + #13 + #13;

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
        { 전자명세서의 상태에 대한 변경이력을 확인합니다.                      
        { - https://developers.popbill.com/reference/statement/delphi/api/info#GetLogs
        {**********************************************************************}
        try
                LogList := statementService.getLogs(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
                exit;        
        end
        else
        begin
                tmp := 'DocLogType(로그타입) | Log(이력정보) | ProcType(처리형태) | ProcMemo(처리메모) | RegDT(등록일시) | IP(아이피)' + #13;

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
        { 발신자가 발행한 전자명세서를 발행취소합니다.
        { - "발행취소" 상태의 전자명세서를 삭제(Delete API) 함수를 이용하면, 전자명세서 관리를 위해 부여했던 문서번호를 재사용 할 수 있습니다.         
        { - https://developers.popbill.com/reference/statement/delphi/api/issue#Cancel
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
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { [작성된 전자명세서 데이터를 팝빌에 저장과 동시에 발행하여, "발행완료" 상태로 처리합니다.
        { - 팝빌 사이트 [전자명세서] > [환경설정] > [전자명세서 관리] 메뉴의 발행시 자동승인 옵션 설정을 통해 전자명세서를 "발행완료" 상태가 아닌 "승인대기" 상태로 발행 처리 할 수 있습니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/issue#Issue
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
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnSendSMSClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        {**********************************************************************}
        { 전자명세서와 관련된 안내 SMS(단문) 문자를 재전송하는 함수로, 팝빌 사이트 [문자·팩스] > [문자] > [전송내역] 메뉴에서 전송결과를 확인 할 수 있습니다.
        { - 메시지는 최대 90byte까지 입력 가능하고, 초과한 내용은 자동으로 삭제되어 전송합니다. (한글 최대 45자)
        { - 함수 호출시 포인트가 과금됩니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#SendSMS
        {**********************************************************************}

        // 발신번호
        sendNum := '070-4304-2991';

        // 수신번호
        receivenUm := '010-000-111';

        // 안내문자 내용, 90byte 초과하는 경우 초과된 내용은 삭제 됩니다.
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
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnSendEmailClick(Sender: TObject);
var
        response : TResponse;
        email : String;
begin
        {**********************************************************************}
        { "승인대기", "발행완료" 상태의 전자명세서와 관련된 발행 안내 메일을 재전송 합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#SendEmail
        {**********************************************************************}

        // 수신자 메일주소
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
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnSendFaxClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { 전자명세서를 팩스로 전송하는 함수로, 팝빌 사이트 [문자·팩스] > [팩스] > [전송내역] 메뉴에서 전송결과를 확인 할 수 있습니다.
        { - 함수 호출시 포인트가 과금됩니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#SendFAX
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
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 로그인 상태로 팝빌 사이트의 전자명세서 임시 문서함 메뉴에 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/info#GetURL
        {**********************************************************************}
        try
                resultURL := statementService.GetURL(txtCorpNum.Text, txtUserID.Text, 'TBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
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
        { 로그인 상태로 팝빌 사이트의 전자명세서 발행 문서함 메뉴에 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/info#GetURL
        {**********************************************************************}
        
        try
                resultURL := statementService.GetURL(txtCorpNum.Text, txtUserID.Text, 'SBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
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
        { 전자명세서 1건의 상세 정보 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/view#GetPopUpURL
        {**********************************************************************}

        try
                resultURL := statementService.getPopupURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
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
        { 전자명세서 1건을 인쇄하기 위한 페이지의 팝업 URL을 반환하며, 페이지내에서 인쇄 설정값을 "공급자" / "공급받는자" / "공급자+공급받는자"용 중 하나로 지정할 수 있습니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - 전자명세서의 공급자는 "발신자", 공급받는자는 "수신자"를 나타내는 용어입니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/view#GetPrintURL
        {*******************************************************************}
        
        try
                resultURL := statementService.getPrintURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
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
        { 전자명세서 안내메일의 상세보기 링크 URL을 반환합니다.
        { - 함수 호출로 반환 받은 URL에는 유효시간이 없습니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/view#GetMailURL
        {**********************************************************************}
        try
                resultURL := statementService.getMailURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
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
       { 전자명세서 1건을 인쇄하기 위한 페이지의 팝업 URL을 반환하며, 페이지내에서 인쇄 설정값을 "공급자" / "공급받는자" / "공급자+공급받는자"용 중 하나로 지정할 수 있습니다.
       { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
       { - 전자명세서의 공급자는 "발신자", 공급받는자는 "수신자"를 나타내는 용어입니다.
       { - https://developers.popbill.com/reference/statement/delphi/api/view#GetPrintURL
       {**********************************************************************}

        // 전자명세서 문서번호 배열, 최대 100건
        SetLength(KeyList,2);
        KeyList[0] := '20220101-001';
        KeyList[1] := '20220101-002';

        try
                resultURL := statementService.getMassPrintURL(txtCorpNum.text, ItemCode, KeyList, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
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
        { "임시저장" 상태의 전자명세서를 수정합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/issue#Update
        {**********************************************************************}

        statement := TStatement.Create;
        
        statement.itemCode := ItemCode;
        statement.formCode := txtFormCode.Text;

         // 전자명세서 문서종류코드, 121-거래명세서, 122-청구서, 123-견적서, 124-발주서, 125-입금표, 126-영수증
        statement.itemCode := ItemCode;

        // 맞춤양식코드, 기본값(공백처리)
        // 별도의 양식으로 전송하고자 하는경우 파트너센터(1600-8536)로 문의주시기 바랍니다.
        statement.formCode := txtFormCode.Text;

        // [필수] 작성일자
        statement.writeDate := '20220101';

        // [필수] {영수, 청구, 없음} 중 기재
        statement.purposeType := '영수';

        // [필수] {과세, 영세, 면세} 중 기재
        statement.taxType :='과세';

        // 발행시 수신자 알림문자 전송여부
        statement.SMSSendYN := false;

        // 전자명세서 문서번호, 1~24자리, 영문, 숫자, '-', '_' 조합으로 구성
        // 사업자별로 중복되지 않도록 구성
        statement.MgtKey := tbMgtKey.Text;


        {**********************************************************************}
        {                             발신자 정보                              }
        {**********************************************************************}

        // 발신자 사업자번호, '-'제외 10자리
        statement.senderCorpNum := txtCorpNum.Text;

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderTaxRegID := '';

        // 발신자 상호
        statement.senderCorpName := '발신자 상호_수정';

        // 발신자 대표자 성명
        statement.senderCEOName := '발신자 대표자 성명_수정';

        // 발신자 주소
        statement.senderAddr := '발신자 주소_수정';

        // 발신자 종목
        statement.senderBizClass := '발신자 종목_수정';

        // 발신자 업태
        statement.senderBizType := '발신자 업태,업태2';

        // 발신자 담당자명
        statement.senderContactName := '발신자 담당자명';

        // 발신자 담당자 메일주소
        statement.senderEmail := 'test@test.com';

        // 발신자 담당자 연락처
        statement.senderTEL := '070-7070-0707';

        // 발신자 담당자 휴대폰번호
        statement.senderHP := '010-000-2222';

        // 발신자 담당자 팩스
        statement.senderFAX := '070-000-111';

        {**********************************************************************}
        {                             수신자 정보                              }
        {**********************************************************************}

        // 수신자 사업자번호, '-' 제외 10자리
        statement.receiverCorpNum := '8888888888';

        // 수신자 상호
        statement.receiverCorpName := '수신자 상호';

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.receiverTaxRegID := '';

        // 수신자 대표자 성명
        statement.receiverCEOName := '수신자 대표자 성명';

        // 수신자 주소
        statement.receiverAddr := '수신자 주소';

        // 수신자 종목
        statement.receiverBizClass := '수신자 업종';

        // 수신자 업태
        statement.receiverBizType := '수신자 업태';

        // 수신자 담당자명
        statement.receiverContactName := '수신자 담당자명';

        // 수신자 담당자 메일주소
        statement.receiverEmail := 'test@receiver.com';

        // 수신자 담당자 연락처
        statement.receiverTEL := '070-1234-1234';

        // 수신자 담당자 휴대폰번호
        statement.receiverHP := '010-111-222';

        // 수신자 담당자 팩스
        statement.receiverFAX := '070-000-111';


        //[필수] 공급가액 합계
        statement.supplyCostTotal := '200000';

        //[필수] 세액 합계
        statement.taxTotal := '20000';

        //[필수] 합계금액.  공급가액 + 세액
        statement.totalAmount := '220000';

        //기재 상 일련번호
        statement.serialNum := '1';

        //비고
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        // 사업자등록증 첨부여부
        statement.businessLicenseYN := false;

        // 통장사본 첨부여부
        statement.bankBookYN := false ;

        {**********************************************************************}
        {                     전자명세서 상세항목(품목) 정보                   }
        { 일련번호(serialNum)은 1부터 순차적으로 기재하시기 바랍니다.          }
        {**********************************************************************}

        //SetLength로 초기화 한후 기재.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20220101';      //거래일자
        statement.detailList[0].itemName := '품목명';          //품목명
        statement.detailList[0].spec := '규격';                //규격
        statement.detailList[0].qty := '1';                    //수량
        statement.detailList[0].unitCost := '100000';          //단가
        statement.detailList[0].supplyCost := '100000';        //공급가액
        statement.detailList[0].tax := '10000';                //세액
        statement.detailList[0].remark := '품목비고';          //비고
        statement.detailList[0].spare1 := '여분1';             //여분1
        statement.detailList[0].spare2 := '여분2';             //여분2
        statement.detailList[0].spare3 := '여분3';             //여분3
        statement.detailList[0].spare4 := '여분4';             //여분4
        statement.detailList[0].spare5 := '여분5';             //여분5

        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //일련번호
        statement.detailList[1].purchaseDT := '20220101';      //거래일자
        statement.detailList[1].itemName := '품목명';          //품목명
        statement.detailList[1].spec := '규격';                //규격
        statement.detailList[1].qty := '1';                    //수량
        statement.detailList[1].unitCost := '100000';          //단가
        statement.detailList[1].supplyCost := '100000';        //공급가액
        statement.detailList[1].tax := '10000';                //세액
        statement.detailList[1].remark := '품목비고';          //비고
        statement.detailList[1].spare1 := '여분1';             //여분1
        statement.detailList[1].spare2 := '여분2';             //여분2
        statement.detailList[1].spare3 := '여분3';             //여분3
        statement.detailList[1].spare4 := '여분4';             //여분4
        statement.detailList[1].spare5 := '여분5';             //여분5


        {**********************************************************************}
        {                           추가속성 항목                              }
        { -추가속성에 관한 자세한 사항은 아래의 URL을 참조.                     }
        { - https://developers.popbill.com/guide/statement/delphi/introduction/statement-form#propertybag-table         }
        {**********************************************************************}
        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';     //전잔액
        statement.propertyBag[0].value := '30000';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';    //현금액
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';    //현잔액
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

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;


procedure TfrmExample.btnGetDetailInfoClick(Sender: TObject);
var
        statement : TStatement;
        tmp : string;
        i : integer;
begin
        {**********************************************************************}
        { 전자명세서 1건의 상세정보 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/info#GetDetailInfo
        {**********************************************************************}

        try
                statement := statementService.getDetailInfo(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := tmp +'itemCode(문서종류 코드) : ' +  IntToStr(statement.itemCode) + #13;
                tmp := tmp +'mgtKey(문서번호) : ' +  statement.mgtKey + #13;
                tmp := tmp +'invoiceNum(문서고유번호) : ' +  statement.invoiceNum + #13;
                tmp := tmp +'formCode(맞춤양식 코드) : ' +  statement.formCode + #13;
                tmp := tmp +'writeDate(작성일자) : ' +  statement.WriteDate + #13;
                tmp := tmp +'taxType(세금형태) : ' +  statement.TaxType + #13;
                tmp := tmp +'purposeType(영수/청구) : ' +  statement.purposeType + #13;
                tmp := tmp +'serialNum(일련번호) : ' +  statement.serialNum + #13;
                tmp := tmp +'taxTotal(세액 합계) : ' +  statement.taxTotal + #13;
                tmp := tmp +'supplyCostTotal(공급가액 합계) : ' +  statement.supplyCostTotal + #13;
                tmp := tmp +'totalAmount(합계금액) : ' +  statement.totalAmount + #13;
                tmp := tmp +'remark1(비고1) : ' +  statement.remark1 + #13;
                tmp := tmp +'remark2(비고2) : ' +  statement.remark2 + #13;
                tmp := tmp +'remark3(비고3) : ' +  statement.remark3 + #13;

                tmp := tmp +'senderCorpNum(발신자 사업자번호) : ' +  statement.SenderCorpNum + #13;
                tmp := tmp +'senderTaxRegID(발신자 종사업장번호) : ' +  statement.SenderTaxRegID + #13;
                tmp := tmp +'senderCorpName(발신자 상호) : ' +  statement.SenderCorpName + #13;
                tmp := tmp +'senderCEOName(발신자 대표자성명) : ' +  statement.SenderCEOName + #13;
                tmp := tmp +'senderAddr(발신자 주소) : ' +  statement.SenderAddr + #13;
                tmp := tmp +'senderBizClass(발신자 종목) : ' +  statement.SenderBizClass + #13;
                tmp := tmp +'senderBizType(발신자 업태) : ' +  statement.SenderBizType + #13;
                tmp := tmp +'senderContactName(발신자 성명) : ' +  statement.SenderContactName + #13;
                tmp := tmp +'senderDeptName(발신자 부서) : ' +  statement.SenderDeptName + #13;
                tmp := tmp +'senderTEL(발신자 연락처) : ' +  statement.SenderTEL + #13;
                tmp := tmp +'senderHP(발신자 휴대전화) : ' +  statement.SenderHP + #13;
                tmp := tmp +'senderEmail(발신자 이메일) : ' +  statement.SenderEmail + #13;
                tmp := tmp +'senderFAX(발신자 팩스) : ' +  statement.senderFAX + #13;

                tmp := tmp +'receiverCorpNum(수신자 사업자번호) : ' +  statement.ReceiverCorpNum + #13;
                tmp := tmp +'receiverTaxRegID(수신자 종사업장번호) : ' +  statement.ReceiverTaxRegID + #13;
                tmp := tmp +'receiverCorpName(수신자 상호) : ' +  statement.ReceiverCorpName + #13;
                tmp := tmp +'receiverCEOName(수신자 대표자성명) : ' +  statement.ReceiverCEOName + #13;
                tmp := tmp +'receiverAddr(수신자 주소) : ' +  statement.ReceiverAddr + #13;
                tmp := tmp +'receiverBizClass(수신자 종목) : ' +  statement.ReceiverBizClass + #13;
                tmp := tmp +'receiverBizType(수신자 업태) : ' +  statement.ReceiverBizType + #13;
                tmp := tmp +'receiverContactName(수신자 성명) : ' +  statement.ReceiverContactName + #13;
                tmp := tmp +'receiverDeptName(수신자 부서) : ' +  statement.ReceiverDeptName + #13;
                tmp := tmp +'receiverTEL(수신자 연락처) : ' +  statement.ReceiverTEL + #13;
                tmp := tmp +'receiverHP(수신자 휴대전화) : ' +  statement.ReceiverHP + #13;
                tmp := tmp +'receiverEmail(수신자 이메일) : ' +  statement.ReceiverEmail + #13;
                tmp := tmp +'receiverFAX(수신자 팩스) : ' +  statement.receiverFAX + #13;

                tmp := tmp + '-----상세항목-----' + #13;
                tmp := tmp + 'serialNum(일련번호) | purchaseDT(거래일자) | itemName(품목명) | spec(규격) | qty(수량) | ';
                tmp := tmp + 'unitCost(단가) | supplyCost(공급가액) | tax(세액) | remark(비고) | spare1(여분1) |';
                tmp := tmp + 'spare1(여분2) | spare1(여분3) | spare1(여분4) | spare1(여분5)' + #13;
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

                tmp := tmp + '-----추가속성-----' + #13;
                for i:= 0 to Length(statement.propertyBag)-1 do
                begin
                    tmp := tmp + statement.propertyBag[i].name + ' : ' +
                                 statement.propertyBag[i].value + #13;
                end;

                tmp := tmp +'businessLicenseYN(사업자등록증 첨부 여부) : ' +  IfThen(statement.businessLicenseYN,'true','false') + #13;
                tmp := tmp +'bankBookYN(통장사본 첨부 여부) : ' +  IfThen(statement.bankBookYN,'true','false') + #13;
                tmp := tmp +'SMSSendYN(문자 자동전송 여부) : ' +  IfThen(statement.SMSSendYN,'true','false') + #13;

                ShowMessage(tmp);
        end;


end;

procedure TfrmExample.btnCheckMgtKeyInUseClick(Sender: TObject);
var
        InUse : boolean;
begin
        {***********************************************************************}
        { 파트너가 전자명세서 관리 목적으로 할당하는 문서번호의 사용여부를 확인합니다.
        { - 이미 사용 중인 문서번호는 중복 사용이 불가하고, 전자명세서가 삭제된 경우에만 문서번호의 재사용이 가능합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/info#CheckMgtKeyInUse
        {***********************************************************************}

        try
                InUse := statementService.CheckMgtKeyInUse(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                if InUse then ShowMessage('사용중') else ShowMessage('미 사용중.');
        end;
end;

procedure TfrmExample.Button1Click(Sender: TObject);
var
  resultURL : String;
begin
       {******************************************************************}
       { "공급받는자" 용 전자명세서 1건을 인쇄하기 위한 페이지의 팝업 URL을 반환합니다.
       { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
       { - 전자명세서의 공급받는자는 "수신자"를 나타내는 용어입니다.
       { - https://developers.popbill.com/reference/statement/delphi/api/view#GetEPrintURL
       {******************************************************************}

        try
                resultURL := statementService.getEPrintURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
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
        { 사용하고자 하는 아이디의 중복여부를 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/member#CheckID
        {**********************************************************************}
        try
                response := statementService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 담당자(팝빌 로그인 계정)를 추가합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/member#RegistContact
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 50자 미만)
        joinInfo.id := 'testkorea';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // [필수] 담당자명(한글이나 영문 100자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처 (최대 20자)
        joinInfo.tel := '070-4304-2991';

        // [필수] 이메일 (최대 100자)
        joinInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        joinInfo.searchRole := '3';

        try
                response := statementService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 목록을 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/member#ListContact
        {**********************************************************************}

        try
                InfoList := statementService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                tmp := 'id(아이디) | email(이메일) | personName(성명) | searchRole(담당자 권한) | ';
                tmp := tmp + 'tel(연락처) | mgrYN(관리자 여부) | regDT(등록일시) | state(상태)' + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].id + ' | ';
                    tmp := tmp + InfoList[i].email + ' | ';
                    tmp := tmp + InfoList[i].personName + ' | ';
                    tmp := tmp + InfoList[i].searchRole + ' | ';
                    tmp := tmp + InfoList[i].tel + ' | ';
                    tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
                    tmp := tmp + InfoList[i].regDT + ' | ';
                    tmp := tmp + IntToStr(InfoList[i].state) + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 수정합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/member#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명 (최대 100자)
        contactInfo.personName := '테스트 담당자';

        // 연락처 (최대 20자)
        contactInfo.tel := '070-4304-2991';

        // 이메일 주소 (최대 100자)
        contactInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        contactInfo.searchRole := '3';

        try
                response := statementService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
               ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/member#GetCorpInfo
        {**********************************************************************}
        try
                corpInfo := statementService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
                tmp := tmp + 'CeoName (대표자 성명) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/member#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 100자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 200자
        corpInfo.corpName := '상호';

        // 업태, 최대 100자
        corpInfo.bizType := '업태';

        // 종목, 최대 100자
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
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnRegistIssueClick(Sender: TObject);
var
        statement : TStatement;
        response : TSMTIssueResponse;
        memo, emailSubject : String;
begin
        {**********************************************************************}
        { 작성된 전자명세서 데이터를 팝빌에 저장과 동시에 발행하여, "발행완료" 상태로 처리합니다.
        { - 팝빌 사이트 [전자명세서] > [환경설정] > [전자명세서 관리] 메뉴의 발행시 자동승인 옵션 설정을 통해 전자명세서를 "발행완료" 상태가 아닌 "승인대기" 상태로 발행 처리 할 수 있습니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/issue#RegistIssue
        {**********************************************************************}

        statement := TStatement.Create;

        // 전자명세서 문서종류코드, 121-거래명세서, 122-청구서, 123-견적서, 124-발주서, 125-입금표, 126-영수증
        statement.itemCode := ItemCode;

        // 맞춤양식코드, 기본값(공백처리)
        // 별도의 양식으로 전송하고자 하는경우 파트너센터(1600-8536)로 문의주시기 바랍니다.
        statement.formCode := txtFormCode.Text;

        // [필수] 작성일자
        statement.writeDate := '20220101';

        // [필수] {영수, 청구, 없음} 중 기재
        statement.purposeType := '영수';

        // [필수] {과세, 영세, 면세} 중 기재
        statement.taxType :='과세';

        // 발행시 수신자 알림문자 전송여부
        statement.SMSSendYN := false;

        // [필수] 전자명세서 문서번호, 1~24자리, 영문, 숫자, '-', '_'
        // 조합으로 구성사업자별로 중복되지 않도록 구성
        statement.MgtKey := tbMgtKey.Text;

        {**********************************************************************}
        {                             발신자 정보                              }
        {**********************************************************************}

        // 발신자 사업자번호, '-'제외 10자리
        statement.senderCorpNum := txtCorpNum.Text;

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderTaxRegID := '';

        // 발신자 상호
        statement.senderCorpName := '발신자 상호';

        // 발신자 대표자 성명
        statement.senderCEOName := '발신자 대표자 성명';

        // 발신자 주소
        statement.senderAddr := '발신자 주소';

        // 발신자 종목
        statement.senderBizClass := '발신자 종목';

        // 발신자 업태
        statement.senderBizType := '발신자 업태,업태2';

        // 발신자 담당자명
        statement.senderContactName := '발신자 담당자명';

        // 발신자 담당자 메일주소
        statement.senderEmail := 'test@test.com';

        // 발신자 담당자 연락처
        statement.senderTEL := '070-7070-0707';

        // 발신자 담당자 휴대폰번호
        statement.senderHP := '010-000-2222';

        // 발신자 담당자 팩스
        statement.senderFAX := '070-000-111';

        {**********************************************************************}
        {                            수신자 정보                               }
        {**********************************************************************}

        // 수신자 사업자번호, '-' 제외 10자리
        statement.receiverCorpNum := '8888888888';

        // 수신자 상호
        statement.receiverCorpName := '수신자 상호';

        //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.receiverTaxRegID := '';

        // 수신자 대표자 성명
        statement.receiverCEOName := '수신자 대표자 성명';

        // 수신자 주소
        statement.receiverAddr := '수신자 주소';

        // 수신자 종목
        statement.receiverBizClass := '수신자 업종';

        // 수신자 업태
        statement.receiverBizType := '수신자 업태';

        // 수신자 담당자명
        statement.receiverContactName := '수신자 담당자명';

        // 수신자 담당자 메일주소
        statement.receiverEmail := 'test@test.com';

        // 수신자 담당자 연락처
        statement.receiverTEL := '070-1234-1234';

        // 수신자 담당자 휴대폰번호
        statement.receiverHP := '010-111-222';

        // 수신자 담당자 팩스
        statement.receiverFAX := '070-000-111';


        //[필수] 공급가액 합계
        statement.supplyCostTotal := '200000';

        //[필수] 세액 합계
        statement.taxTotal := '20000';

        //[필수] 합계금액.  공급가액 + 세액
        statement.totalAmount := '220000';

        // 기재 상 일련번호
        statement.serialNum := '1';

        // 비고
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        // 사업자등록증 첨부여부
        statement.businessLicenseYN := false;

        // 통장사본 첨부여부
        statement.bankBookYN := false;

        {**********************************************************************}
        {                     전자명세서 상세항목(품목) 정보                   }
        { 일련번호(serialNum)은 1부터 순차적으로 기재하시기 바랍니다.          }
        {**********************************************************************}

        //SetLength로 초기화 한후 기재.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20220101';      //거래일자
        statement.detailList[0].itemName := '품목명';          //품목명
        statement.detailList[0].spec := '규격';                //규격
        statement.detailList[0].qty := '1';                    //수량
        statement.detailList[0].unitCost := '100000';          //단가
        statement.detailList[0].supplyCost := '100000';        //공급가액
        statement.detailList[0].tax := '10000';                //세액
        statement.detailList[0].remark := '품목비고';          //비고
        statement.detailList[0].spare1 := '여분1';             //여분1
        statement.detailList[0].spare2 := '여분2';             //여분2
        statement.detailList[0].spare3 := '여분3';             //여분3
        statement.detailList[0].spare4 := '여분4';             //여분4
        statement.detailList[0].spare5 := '여분5';             //여분5

        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //일련번호
        statement.detailList[1].purchaseDT := '20220101';      //거래일자
        statement.detailList[1].itemName := '품목명';          //품목명
        statement.detailList[1].spec := '규격';                //규격
        statement.detailList[1].qty := '1';                    //수량
        statement.detailList[1].unitCost := '100000';          //단가
        statement.detailList[1].supplyCost := '100000';        //공급가액
        statement.detailList[1].tax := '10000';                //세액
        statement.detailList[1].remark := '품목비고';          //비고
        statement.detailList[1].spare1 := '여분1';             //여분1
        statement.detailList[1].spare2 := '여분2';             //여분2
        statement.detailList[1].spare3 := '여분3';             //여분3
        statement.detailList[1].spare4 := '여분4';             //여분4
        statement.detailList[1].spare5 := '여분5';             //여분5

        {**********************************************************************}
        {                           추가속성 항목                              }
        { -추가속성에 관한 자세한 사항은 아래의 URL을 참조.                     }
        { - https://developers.popbill.com/guide/statement/delphi/introduction/statement-form#propertybag-table         }
        {**********************************************************************}

        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';     //전잔액
        statement.propertyBag[0].value := '30000';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';    //현금액
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';    //현잔액
        statement.propertyBag[2].value := '10000';

        memo := '즉시발행 메모';

        // 안내메일 제목, 미기재시 기본양식으로 전송
        emailSubject := '';

        try
                response := statementService.RegistIssue(txtCorpNum.text, statement, memo, txtUserID.text, emailSubject);
                statement.Free;
        except
                on le : EPopbillException do begin
                        statement.Free;
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message + #10#13 +'팝빌 승인번호 : '+  response.invoiceNum);
        end;

end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/point#GetChargeURL
        {**********************************************************************}
        try
                resultURL := statementService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 사업자번호를 조회하여 연동회원 가입여부를 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/member#CheckIsMember
        {**********************************************************************}
        try
                response := statementService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnCancelClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 발신자가 발행한 전자명세서를 발행취소합니다.
        { - "발행취소" 상태의 전자명세서를 삭제(Delete API) 함수를 이용하면, 전자명세서 관리를 위해 부여했던 문서번호를 재사용 할 수 있습니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/issue#Cancel
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
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnDelete_registIssueClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 삭제 가능한 상태의 전자명세서를 삭제합니다.
        { - 삭제 가능한 상태: "임시저장", "취소", "승인거부", "발행취소"
        { - 전자명세서를 삭제하면 사용된 문서번호(mgtKey)를 재사용할 수 있습니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/issue#Delete
        {**********************************************************************}

        try
                response := statementService.Delete(txtCorpNum.text, ItemCode, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnFaxSendClick(Sender: TObject);
var
        statement : TStatement;
        response : String;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { 전자명세서를 팩스로 전송하는 함수로, 팝빌에 데이터를 저장하는 과정이 없습니다.
        { - 팝빌 사이트 [문자·팩스] > [팩스] > [전송내역] 메뉴에서 전송결과를 확인 할 수 있습니다.
        { - 함수 호출시 포인트가 과금됩니다.
        { - 선팩스 전송 요청 시 작성한 문서번호는 팩스로 전송되는 파일명에 사용됩니다.
        { - 팩스 전송결과를 확인하기 위해서는 선팩스 전송 요청 시 반환받은 접수번호를 이용하여 팩스 API의 전송내역 확인 (GetFaxResult API) 함수를 이용하면 됩니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#FAXSend
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
        // 별도의 양식으로 전송하고자 하는경우 파트너센터(1600-8536)로 문의주시기 바랍니다.
        statement.formCode := txtFormCode.Text;

        // [필수] 작성일자
        statement.writeDate := '20220101';

        // [필수] {영수, 청구, 없음} 중 기재
        statement.purposeType := '영수';

        // [필수] {과세, 영세, 면세} 중 기재
        statement.taxType :='과세';

        // 발행시 수신자 알림문자 전송여부
        statement.SMSSendYN := false;

        // 거래명세서 문서번호, 1~24자리, 영문, 숫자, '-', '_' 조합으로 구성
        // 사업자별로 중복되지 않도록 구성
        statement.MgtKey := tbMgtKey.Text;

        {**********************************************************************}
        {                             발신자 정보                              }
        {**********************************************************************}

        // 발신자 사업자번호, '-'제외 10자리
        statement.senderCorpNum := txtCorpNum.Text;

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderTaxRegID := '';

        // 발신자 상호
        statement.senderCorpName := '발신자 상호';

        // 발신자 대표자 성명
        statement.senderCEOName := '발신자 대표자 성명';

        // 발신자 주소
        statement.senderAddr := '발신자 주소';

        // 발신자 종목
        statement.senderBizClass := '발신자 종목';

        // 발신자 업태
        statement.senderBizType := '발신자 업태,업태2';

        // 발신자 담당자명
        statement.senderContactName := '발신자 담당자명';

        // 발신자 담당자 메일주소
        statement.senderEmail := 'test@test.com';

        // 발신자 담당자 연락처
        statement.senderTEL := '070-7070-0707';

        // 발신자 담당자 휴대폰번호
        statement.senderHP := '010-000-2222';


        {**********************************************************************}
        {                              수신자 정보                             }
        {**********************************************************************}

        // 수신자 사업자번호, '-' 제외 10자리
        statement.receiverCorpNum := '8888888888';

        // 수신자 상호
        statement.receiverCorpName := '수신자 상호';

        // 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.receiverTaxRegID := '';

        // 수신자 대표자 성명
        statement.receiverCEOName := '수신자 대표자 성명';

        // 수신자 주소
        statement.receiverAddr := '수신자 주소';

        // 수신자 종목
        statement.receiverBizClass := '수신자 업종';

        // 수신자 업태
        statement.receiverBizType := '수신자 업태';

        // 수신자 담당자명
        statement.receiverContactName := '수신자 담당자명';

        // 수신자 담당자 메일주소
        statement.receiverEmail := 'test@receiver.com';

        // 수신자 담당자 연락처
        statement.receiverTEL := '070-1234-1234';

        // 수신자 담당자 휴대폰번호
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
        { 일련번호(serialNum)은 1부터 순차적으로 기재하시기 바랍니다.          }
        {**********************************************************************}
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20220101';      //거래일자
        statement.detailList[0].itemName := '품목명';          //품목명
        statement.detailList[0].spec := '규격';                //규격
        statement.detailList[0].qty := '1';                    //수량
        statement.detailList[0].unitCost := '100000';          //단가
        statement.detailList[0].supplyCost := '100000';        //공급가액
        statement.detailList[0].tax := '10000';                //세액
        statement.detailList[0].remark := '품목비고';          //비고
        statement.detailList[0].spare1 := '여분1';             //여분1
        statement.detailList[0].spare2 := '여분2';             //여분2
        statement.detailList[0].spare3 := '여분3';             //여분3
        statement.detailList[0].spare4 := '여분4';             //여분4
        statement.detailList[0].spare5 := '여분5';             //여분5

        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;                //일련번호
        statement.detailList[1].purchaseDT := '20220101';      //거래일자
        statement.detailList[1].itemName := '품목명';          //품목명
        statement.detailList[1].spec := '규격';                //규격
        statement.detailList[1].qty := '1';                    //수량
        statement.detailList[1].unitCost := '100000';          //단가
        statement.detailList[1].supplyCost := '100000';        //공급가액
        statement.detailList[1].tax := '10000';                //세액
        statement.detailList[1].remark := '품목비고';          //비고
        statement.detailList[1].spare1 := '여분1';             //여분1
        statement.detailList[1].spare2 := '여분2';             //여분2
        statement.detailList[1].spare3 := '여분3';             //여분3
        statement.detailList[1].spare4 := '여분4';             //여분4
        statement.detailList[1].spare5 := '여분5';             //여분5

        {**********************************************************************}
        {                           추가속성 항목                              }
        { -추가속성에 관한 자세한 사항은 아래의 URL을 참조.                     }
        { - https://developers.popbill.com/guide/statement/delphi/introduction/statement-form#propertybag-table         }
        {**********************************************************************}

        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';     //전잔액
        statement.propertyBag[0].value := '30000';

        statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';    //현금액
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'Deposit';    //현잔액
        statement.propertyBag[2].value := '10000';

        try
                response := statementService.FAXSend(txtCorpNum.text, statement, sendNum, receiveNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('팩스접수번호(receiptNum) : '+ response);
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
        { 검색조건에 해당하는 전자명세서를 조회합니다. (조회기간 단위 : 최대 6개월)          
        { - https://developers.popbill.com/reference/statement/delphi/api/info#Search
        {********************************************************************}

        // [필수] 일자유형 { R: 등록일자, W:작성일자, I:발행일자 }
        DType := 'W';

        // [필수] 검색 시작일자, 작성형태(yyyyMMdd)
        SDate := '20220101';

        // [필수] 검색 종료일자, 작성형태(yyyyMMdd)
        EDate := '20220110';

        // 전송상태값 배열. 미기재시 전체조회, 문서상태 값 3자리의 배열, 2,3번째 자리 와일드 카드 사용가능
        SetLength(StateList, 2);
        StateList[0] := '2**';
        StateList[1] := '3**';

        { 문서종류 코드배열
         121 - 거래명세서, 122 - 청구서
         123 - 견적서, 124 - 발주서
         125 - 입금표, 126 - 영수증 }
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
                        SearchList.Free;
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                tmp := 'code(응답코드) : '+IntToStr(SearchList.code) + #13;
                tmp := tmp + 'total(총 검색결과 건수) : '+ IntToStr(SearchList.total) + #13;
                tmp := tmp + 'perPage(페이지당 검색개수) : '+ IntToStr(SearchList.perPage) + #13;
                tmp := tmp + 'pageNum(페이지 번호) : '+ IntToStr(SearchList.pageNum) + #13;
                tmp := tmp + 'pageCount(페이지 개수) : '+ IntToStr(SearchList.pageCount) + #13;
                tmp := tmp + 'message(응답메시지) : '+ SearchList.message + #13#13;

                tmp := tmp + 'itemCode(문서종류코드) | itemKey(팝빌번호) | invoiceNum(문서고유번호) | mgtKey(문서번호) | taxType(세금형태) | ';
                tmp := tmp + 'writeDate(작성일자) | regDT(임시저장일시) | senderCorpName(발신자 상호) | senderCorpNum(발신자 사업자번호) | ' ;
                tmp := tmp + 'senderPrintYN(발신자 인쇄여부) | receiverCorpName(수신자 상호) | receiverCorpNum(수신자 사업자번호) | ';
                tmp := tmp + 'receiverPrintYN(수신자 인쇄여부) | supplyCostTotal(공급가액 합계) | taxTotal(세액 합계) | purposeType(영수/청구) | ';
                tmp := tmp + 'issueDT(발행일시) | stateCode(상태코드) | stateDT(상태 변경일시) | stateMemo(상태메모) | ';
                tmp := tmp + 'openYN(개봉 여부) | openDT(개봉 일시)' + #13 + #13;

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

end;

procedure TfrmExample.btnAttachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {**********************************************************************}
        { 하나의 전자명세서에 다른 전자명세서를 첨부합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#AttachStatement
        {**********************************************************************}

        // 첨부할 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        SubItemCode := 121;

        // 첨부할 전자명세서 문서번호
        SubMgtKey := '20220101-002';

        try
                response := statementService.AttachStatement(txtCorpNum.text, ItemCode, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnDetachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {**********************************************************************}
        { 하나의 전자명세서에 첨부된 다른 전자명세서를 해제합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#DetachStatement
        {**********************************************************************}

        // 첨부해제할 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        SubItemCode := 121;

        // 첨부해제할 전자명세서 문서번호
        SubMgtKey := '20220101-002';

        try
                response := statementService.DetachStatement(txtCorpNum.text, ItemCode, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TStatementChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 팝빌 전자명세서 API 서비스 과금정보를 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/point#GetChargeInfo
        {**********************************************************************}
        
        try
                chargeInfo := statementService.GetChargeInfo(txtCorpNum.text, ItemCode);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetSealURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 전자명세서에 첨부할 인감, 사업자등록증, 통장사본을 등록하는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#GetSealURL
        {**********************************************************************}
        try
                resultURL := statementService.getSealURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
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
        { 전자명세서 1건을 인쇄하기 위한 페이지의 팝업 URL을 반환하며, 페이지내에서 인쇄 설정값을 "공급자" / "공급받는자" / "공급자+공급받는자"용 중 하나로 지정할 수 있습니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - 전자명세서의 공급자는 "발신자", 공급받는자는 "수신자"를 나타내는 용어입니다.           
        { - https://developers.popbill.com/reference/statement/delphi/api/point#GetPartnerURL 
        {**********************************************************************}
        
        try
                resultURL := statementService.getPartnerURL(txtCorpNum.Text, 'CHRG');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnListEmailConfigClick(Sender: TObject);
var
        EmailConfigList : TEmailConfigList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 전자명세서 관련 메일 항목에 대한 발송설정을 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#ListEmailConfig
        {**********************************************************************}

        try
                EmailConfigList := statementService.ListEmailConfig(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+  statementService.LastErrMessage);
        end
        else
        begin
                tmp := 'emailType(메일전송유형) | sendYN(전송여부)' + #13;
                for i := 0 to Length(EmailConfigList) -1 do
                begin
                    if EmailConfigList[i].EmailType = 'SMT_ISSUE' then
                        tmp := tmp + 'SMT_ISSUE (수신자에게 전자명세서가 발행 되었음을 알려주는 메일입니다.) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                    if EmailConfigList[i].EmailType = 'SMT_ACCEPT' then
                        tmp := tmp + 'SMT_ACCEPT (발신자에게 전자명세서가 승인 되었음을 알려주는 메일입니다.) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                    if EmailConfigList[i].EmailType = 'SMT_DENY' then
                        tmp := tmp + 'SMT_DENY (발신자에게 전자명세서가 거부 되었음을 알려주는 메일입니다.) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                    if EmailConfigList[i].EmailType = 'SMT_CANCEL' then
                        tmp := tmp + 'SMT_CANCEL (수신자에게 전자명세서가 취소 되었음을 알려주는 메일입니다.) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                    if EmailConfigList[i].EmailType = 'SMT_CANCEL_ISSUE' then
                        tmp := tmp + 'SMT_CANCEL_ISSUE (수신자에게 전자명세서가 발행취소 되었음을 알려주는 메일입니다.) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
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
        { 전자명세서 관련 메일 항목에 대한 발송설정을 수정합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/etc#UpdateEmailConfig
        {
        { 메일전송유형
        {  SMT_ISSUE : 수신자에게 전자명세서가 발행 되었음을 알려주는 메일 알림
        {  SMT_ACCEPT : 발신자에게 전자명세서가 승인 되었음을 알려주는 메일 알림
        {  SMT_DENY : 발신자에게 전자명세서가 거부 되었음을 알려주는 메일 알림
        {  SMT_CANCEL : 수신자에게 전자명세서가 취소 되었음을 알려주는 메일 알림
        {  SMT_CANCEL_ISSUE : 수신자에게 전자명세서가 발행취소 되었음을 알려주는 메일 알림  
        {***********************************************************************************}

        // 메일전송유형
        EmailType := 'SMT_ISSUE';

        // 전송여부 (True - 전송, False - 미전송)
        SendYN := True;

        try
                response := statementService.UpdateEmailConfig(txtCorpNum.text, EmailType, SendYN);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;


procedure TfrmExample.btnGetPDFURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {*******************************************************************}
        { 1건의 전자명세서 보기 팝업 URL을 반환합니다.(메뉴,버튼 제외)
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        {https://developers.popbill.com/reference/statement/delphi/api/view#GetViewURL
        {*******************************************************************}
        
        try
                resultURL := statementService.getViewURL(txtCorpNum.Text, ItemCode, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 결제내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/point#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := statementService.getPaymentURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 사용내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/point#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := statementService.getUseHistoryURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 확인합니다.
        { - https://developers.popbill.com/reference/statement/delphi/api/member#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := statementService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if statementService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(statementService.LastErrCode) + #10#13 +'응답메시지 : '+ statementService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (아이디) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (담당자 성명) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (담당자 연락처(전화번호)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'email (담당자 이메일) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (등록 일시) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (담당자 권한) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (관리자 여부) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (계정상태) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.
