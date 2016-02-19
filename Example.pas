unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillStatement, ExtCtrls;

const
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
        //전자명세서 모듈 초기화.
        statementService := TStatementService.Create(LinkID,SecretKey);

        //연동환경 설정값, true(테스트용), false(상업용)
        statementService.IsTest := true;

        //Exception 처리 설정값, true(기본값)
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
        joinInfo.LinkID := LinkID;        //링크아이디
        joinInfo.CorpNum := '1231212312'; //사업자번호 '-' 제외.
        joinInfo.CEOName := '대표자성명';
        joinInfo.CorpName := '상호';
        joinInfo.Addr := '주소';
        joinInfo.ZipCode := '500-100';
        joinInfo.BizType := '업태';
        joinInfo.BizClass := '업종';
        joinInfo.ID     := 'userid';  //6자 이상 20자 미만.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6자 이상 20자 미만.
        joinInfo.ContactName := '담당자명';
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
        
        statement.writeDate := '20160126';             //필수, 기재상 작성일자
        statement.purposeType := '영수';               //필수, {영수, 청구}
        statement.taxType :='과세';                    //필수, {과세, 영세, 면세}
        statement.SMSSendYN := false;                   //발행시 문자발송기능 사용시 활용
        statement.AutoAcceptYN := false;                //수신자 승인없이 밸행시에 승인 처리여부.
        statement.MgtKey := tbMgtKey.Text;

        statement.senderCorpNum := '1234567890';        //공급자 사업자번호
        statement.senderTaxRegID := '';                 //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderCorpName := '공급자 상호';
        statement.senderCEOName := '공급자"" 대표자 성명';
        statement.senderAddr := '공급자 주소';
        statement.senderBizClass := '공급자 업종';
        statement.senderBizType := '공급자 업태,업태2';
        statement.senderContactName := '공급자 담당자명';
        statement.senderEmail := 'test@test.com';
        statement.senderTEL := '070-7070-0707';
        statement.senderHP := '010-000-2222';

        statement.receiverCorpNum := '8888888888';       // 공급받는자 사업자번호
        statement.receiverCorpName := '공급받는자 상호';
        statement.receiverTaxRegID := '';               //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.receiverCEOName := '공급받는자 대표자 성명';
        statement.receiverAddr := '공급받는자 주소';
        statement.receiverBizClass := '공급받는자 업종';
        statement.receiverBizType := '공급받는자 업태';
        statement.receiverContactName := '공급받는자 담당자명';
        statement.receiverEmail := 'test@receiver.com';

        statement.supplyCostTotal := '100000';         //필수 공급가액 합계
        statement.taxTotal := '10000';                 //필수 세액 합계
        statement.totalAmount := '110000';             //필수 합계금액.  공급가액 + 세액

        statement.serialNum := '123';                  //기재상 일련번호
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        statement.businessLicenseYN := false; //사업자등록증 이미지 첨부시 설정.
        statement.bankBookYN := false ;        //통장사본 이미지 첨부시 설정.


        //상세항목 0~99개 까지 작성가능.
        // SerialNum 은 1부터 99까지 순차기재.
        //SetLength로 초기화 한후 기재.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20140319';      //거래일자
        statement.detailList[0].itemName := '품/\목명';
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
        statement.detailList[1].serialNum := 2;
        statement.detailList[1].itemName := '품목"명';

        //추가속성항목, 자세한 사항은 [전자명세서 api 연동매뉴얼 > 5.2. 기본양식 추가속성 테이블] 참조
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

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

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

        ShowMessage(cbItemCode.Text +' 발행단가 : '+ FloatToStr(unitcost));
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

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

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
        memo := '발행취소 메모';
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
        memo := '발행 메모';
        
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
        sendNum := '010-1234-1234';      // 발신번호
        receivenUm := '010-123-123';     // 수신번호
        contents := '세금계산서가 발행되었습니다. 메일 확인 바랍니다.';       // 안내문자 내용, 90byte 초과하는 경우 길이가 조정되어 전송됨.
        
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
        email := 'test@test.com';       // 수신 메일주소
        
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
        sendNum := '080-1234-1234';      // 팩스 발신번호
        receiveNum := '02-111-222';     // 팩스 수신번호

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
        
        statement.writeDate := '20150610';             //필수, 기재상 작성일자
        statement.purposeType := '영수';               //필수, {영수, 청구}
        statement.taxType :='과세';                    //필수, {과세, 영세, 면세}
        statement.SMSSendYN := true;                   //발행시 문자발송기능 사용시 활용
        statement.AutoAcceptYN := true;                //수신자 승인없이 밸행시에 승인 처리여부.
        statement.MgtKey := tbMgtKey.Text;

        statement.senderCorpNum := '1234567890';
        statement.senderTaxRegID := ''; //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderCorpName := '공급자 상호';
        statement.senderCEOName := '공급자"" 대표자 성명';
        statement.senderAddr := '공급자 주소';
        statement.senderBizClass := '공급자 업종';
        statement.senderBizType := '공급자 업태,업태2';
        statement.senderContactName := '공급자 담당자명';
        statement.senderEmail := 'test@test.com';
        statement.senderTEL := '070-7070-0707';
        statement.senderHP := '010-000-2222';

        statement.receiverCorpNum := '8888888888';
        statement.receiverCorpName := '공급받는자 상호';
        statement.receiverCEOName := '공급받는자 대표자 성명';
        statement.receiverAddr := '공급받는자 주소';
        statement.receiverBizClass := '공급받는자 업종';
        statement.receiverBizType := '공급받는자 업태';
        statement.receiverContactName := '공급받는자 담당자명';
        statement.receiverEmail := 'test@receiver.com';

        statement.supplyCostTotal := '100000';         //필수 공급가액 합계
        statement.taxTotal := '10000';                 //필수 세액 합계
        statement.totalAmount := '110000';             //필수 합계금액.  공급가액 + 세액

        statement.serialNum := '123';
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        statement.businessLicenseYN := false; //사업자등록증 이미지 첨부시 설정.
        statement.bankBookYN := false ;        //통장사본 이미지 첨부시 설정.
        statement.faxsendYN := false;          //발행시 Fax발송시 설정.


        //상세항목 0~99개 까지 작성가능.
        // SerialNum 은 1부터 99까지 순차기재.
        //SetLength로 초기화 한후 기재.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20140319';      //거래일자
        statement.detailList[0].itemName := '품목명';
        statement.detailList[0].spec := '규격';
        statement.detailList[0].qty := '1';                    //수량
        statement.detailList[0].unitCost := '100000';          //단가
        statement.detailList[0].supplyCost := '100000';        //공급가액
        statement.detailList[0].tax := '10000';                //세액
        statement.detailList[0].remark := '품목비고';
        


        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;
        statement.detailList[1].itemName := '품목"명';


        //추가속성항목, 자세한 사항은 [전자명세서 api 연동매뉴얼 > 5.2. 기본양식 추가속성 테이블] 참조
        setLength(statement.propertyBag,3);

        statement.propertyBag[0] := TProperty.Create;
        statement.propertyBag[0].name := 'Balance';
        statement.propertyBag[0].value := '10000';

         statement.propertyBag[1] := TProperty.Create;
        statement.propertyBag[1].name := 'CBalance';
        statement.propertyBag[1].value := '20000';

        statement.propertyBag[2] := TProperty.Create;
        statement.propertyBag[2].name := 'TestProperty';
        statement.propertyBag[2].value := '"한글1111임"';

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

        tmp := tmp + '-----상세항목-----' + #13;

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

        tmp := tmp + '-----추가속성-----' + #13;

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

        if InUse then ShowMessage('사용중') else ShowMessage('미 사용중.');
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
        joinInfo.id := 'userid';                        // [필수] 아이디 (6자 이상 20자 미만)
        joinInfo.pwd := 'thisispassword';               // [필수] 비밀번호 (6자 이상 20자 미만)
        joinInfo.personName := '담당자성명';            // [필수] 담당자명(한글이나 영문 30자 이내)
        joinInfo.tel := '070-7510-3710';                // [필수] 연락처
        joinInfo.hp := '010-1111-2222';                 // 휴대폰번호
        joinInfo.fax := '02-6442-9700';                 // 팩스번호
        joinInfo.email := 'test@test.com';              // [필수] 이메일
        joinInfo.searchAllAllowYN := false;             // 조회권한(true 회사조회/ false 개인조회)
        joinInfo.mgrYN     := false;                    // 관리자 권한여부 

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

        contactInfo.personName := '테스트 담당자';      // 담당자명
        contactInfo.tel := '070-7510-3710';             // 연락처
        contactInfo.hp := '010-4324-1111';              // 휴대폰번호
        contactInfo.email := 'test@test.com';           // 이메일 주소
        contactInfo.fax := '02-6442-9799';              // 팩스번호
        contactInfo.searchAllAllowYN := true;           // 회사조회 권한여부
        contactInfo.mgrYN := false;                     // 관리자 전환 여부 

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

        corpInfo.ceoname := '대표자명';         //대표자명
        corpInfo.corpName := '팝빌';            // 회사명
        corpInfo.bizType := '업태';             // 업태
        corpInfo.bizClass := '업종';            // 업종
        corpInfo.addr := '서울특별시 강남구 영동대로 517';  // 주소

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
        
        statement.writeDate := '20160126';             //필수, 기재상 작성일자
        statement.purposeType := '영수';               //필수, {영수, 청구}
        statement.taxType :='과세';                    //필수, {과세, 영세, 면세}
        statement.SMSSendYN := false;                  //발행시 문자발송기능 사용시 활용
        statement.AutoAcceptYN := true;               //수신자 승인없이 밸행시에 승인 처리여부.
        statement.MgtKey := tbMgtKey.Text;

        statement.senderCorpNum := '1234567890';       //공급자 사업자번호
        statement.senderTaxRegID := '';                //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderCorpName := '공급자 상호';
        statement.senderCEOName := '공급자 대표자 성명';
        statement.senderAddr := '공급자 주소';
        statement.senderBizClass := '공급자 업종';
        statement.senderBizType := '공급자 업태,업태2';
        statement.senderContactName := '공급자 담당자명';
        statement.senderEmail := 'test@test.com';
        statement.senderTEL := '070-7070-0707';
        statement.senderHP := '010-000-2222';

        statement.receiverCorpNum := '8888888888';    // 공급받는자 사업자번호
        statement.receiverCorpName := '공급받는자 상호';
        statement.receiverTaxRegID := '';             //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.receiverCEOName := '공급받는자 대표자 성명';
        statement.receiverAddr := '공급받는자 주소';
        statement.receiverBizClass := '공급받는자 업종';
        statement.receiverBizType := '공급받는자 업태';
        statement.receiverContactName := '공급받는자 담당자명';
        statement.receiverEmail := 'test@receiver.com';
        statement.receiverTEL := '070-1234-1234';
        statement.receiverHP := '010-111-222';

        statement.supplyCostTotal := '100000';         //필수 공급가액 합계
        statement.taxTotal := '10000';                 //필수 세액 합계
        statement.totalAmount := '110000';             //필수 합계금액.  공급가액 + 세액

        statement.serialNum := '123';                  // 기재 상 일련번호
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        statement.businessLicenseYN := false; //사업자등록증 이미지 첨부시 설정.
        statement.bankBookYN := false ;        //통장사본 이미지 첨부시 설정.

        //상세항목 0~99개 까지 작성가능.
        // SerialNum 은 1부터 99까지 순차기재.
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
        statement.detailList[1].serialNum := 2;
        statement.detailList[1].itemName := '품목명';

        //추가속성항목, 자세한 사항은 [전자명세서 api 연동매뉴얼 > 5.2. 기본양식 추가속성 테이블] 참조
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
                memo := '즉시발행 메모';
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
        memo := '발행취소 메모';
        
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
        
        statement.writeDate := '20150923';             //필수, 기재상 작성일자
        statement.purposeType := '영수';               //필수, {영수, 청구}
        statement.taxType :='과세';                    //필수, {과세, 영세, 면세}
        statement.SMSSendYN := false;                  //발행시 문자발송기능 사용시 활용
        statement.AutoAcceptYN := false;               //수신자 승인없이 밸행시에 승인 처리여부.
        statement.MgtKey := tbMgtKey.Text;             //팩스파일명

        statement.senderCorpNum := '1234567890';
        statement.senderTaxRegID := ''; //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        statement.senderCorpName := '공급자 상호';
        statement.senderCEOName := '공급자"" 대표자 성명';
        statement.senderAddr := '공급자 주소';
        statement.senderBizClass := '공급자 업종';
        statement.senderBizType := '공급자 업태,업태2';
        statement.senderContactName := '공급자 담당자명';
        statement.senderEmail := 'test@test.com';
        statement.senderTEL := '070-7070-0707';
        statement.senderHP := '010-000-2222';

        statement.receiverCorpNum := '8888888888';
        statement.receiverCorpName := '공급받는자 상호';
        statement.receiverCEOName := '공급받는자 대표자 성명';
        statement.receiverAddr := '공급받는자 주소';
        statement.receiverBizClass := '공급받는자 업종';
        statement.receiverBizType := '공급받는자 업태';
        statement.receiverContactName := '공급받는자 담당자명';
        statement.receiverEmail := 'test@receiver.com';
        statement.receiverFAX :='010-2222-1111';

        statement.supplyCostTotal := '100000';         //필수 공급가액 합계
        statement.taxTotal := '10000';                 //필수 세액 합계
        statement.totalAmount := '110000';             //필수 합계금액.  공급가액 + 세액

        statement.serialNum := '123';
        statement.remark1 := '비고1';
        statement.remark2 := '비고2';
        statement.remark3 := '비고3';

        statement.businessLicenseYN := false; //사업자등록증 이미지 첨부시 설정.
        statement.bankBookYN := false ;        //통장사본 이미지 첨부시 설정.
        statement.faxsendYN := false;          //발행시 Fax발송시 설정.



        //상세항목 0~99개 까지 작성가능.
        // SerialNum 은 1부터 99까지 순차기재.
        //SetLength로 초기화 한후 기재.
        setLength(statement.detailList, 2);

        statement.detailList[0] := TStatementDetail.Create;
        statement.detailList[0].serialNum := 1;                //일련번호
        statement.detailList[0].purchaseDT := '20140319';      //거래일자
        statement.detailList[0].itemName := '품/\목명';
        statement.detailList[0].spec := '규격';
        statement.detailList[0].qty := '1';                    //수량
        statement.detailList[0].unitCost := '100000';          //단가
        statement.detailList[0].supplyCost := '100000';        //공급가액
        statement.detailList[0].tax := '10000';                //세액
        statement.detailList[0].remark := '품목비고';


        statement.detailList[1] := TStatementDetail.Create;
        statement.detailList[1].serialNum := 2;
        statement.detailList[1].itemName := '품목"명';

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

        DType := 'R';                   // [필수] 일자유형 { R: 등록일자, W:작성일자, I:발행일자 }
        SDate := '20160101';            // [필수] 검색 시작일자, 작성형태(yyyyMMdd)
        EDate := '20160112';            // [필수] 검색 종료일자, 작성형태(yyyyMMdd)

        SetLength(StateList, 3);        // 전송상태값 배열. 미기재시 전체조회, 문서상태 값 3자리의 배열, 2,3번째 자리 와일드 카드 사용가능
        StateList[0] := '1**';
        StateList[1] := '2**';
        StateList[2] := '3**';

        SetLength(ItemCodeList, 6);     // 문서종류 코드배열
        ItemCodeList[0] := 121;         // 거래명세서
        ItemCodeList[1] := 122;         // 청구서
        ItemCodeList[2] := 123;         // 견적서
        ItemCodeList[3] := 124;         // 발주서
        ItemCodeList[4] := 125;         // 입금표
        ItemCodeList[5] := 126;         // 영수증

        Page := 1;                      // 페이지 번호, 기본값 1
        PerPage := 30;                  // 페이지당 검색갯수, 기본값 500, 최대 1000

        Order := 'D';                   // 'D' : 내림차순 , 'A' : 오름차순

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
            tmp := tmp + IntToStr(SearchList.list[i].ItemCode) + ' | '          // 문서종류 코드
                + SearchList.list[i].ItemKey + ' | '                            // 아이템코드
                + IntToStr(SearchList.list[i].StateCode) + ' | '                // 상태코드
                + SearchList.list[i].TaxType + ' | '                            // 과세형태
                + SearchList.list[i].WriteDate + ' | '                          // 작성일자
                + SearchList.list[i].SenderCorpName + ' | '                     // 발신자 상호
                + SearchList.list[i].SenderCorpNum + ' | '                      // 발신자 사업자번호
                + SearchList.list[i].ReceiverCorpName + ' | '                   // 수신자 상호
                + SearchList.list[i].ReceiverCorpNum + ' | '                    // 수신자 사업자번호
                + SearchList.list[i].SupplyCostTotal + ' | '                    // 공급가액 합계
                + SearchList.list[i].TaxTotal + ' | '                           // 세액 합계
                + SearchList.list[i].RegDT + ' | '                              // 임시저장 일시 (yyyyMMddHHmmss)
                + BoolToStr(SearchList.list[i].SenderPrintYN) + ' | '           // 발신자 인쇄여부
                + BoolToStr(SearchList.list[i].receiverPrintYN) + ' | ' + #13;   // 수신자 인쇄여부
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
        SubItemCode := 121;             // 첨부할 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        SubMgtKey := '20151223-01';     // 첨부할 전자명세서 문서관리번호

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
        SubItemCode := 121;             // 첨부해제할 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        SubMgtKey := '20151223-01';     // 첨부해제할 전자명세서 문서관리번호

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
