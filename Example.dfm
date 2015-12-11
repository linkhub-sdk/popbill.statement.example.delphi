object frmExample: TfrmExample
  Left = 412
  Top = 185
  Width = 870
  Height = 672
  Caption = '팝빌 전자명세서 SDK Example'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 12
    Width = 120
    Height = 13
    Caption = '팝빌회원 사업자번호 : '
  end
  object Label4: TLabel
    Left = 304
    Top = 12
    Width = 96
    Height = 13
    Caption = '팝빌회원 아이디 : '
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 224
    Width = 825
    Height = 393
    Caption = '전자명세서 관련 API'
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 94
      Width = 129
      Height = 13
      AutoSize = False
      Caption = '문서관리번호(MgtKey) :'
    end
    object Label5: TLabel
      Left = 48
      Top = 70
      Width = 121
      Height = 13
      AutoSize = False
      Caption = '양식코드(FormCode) :'
    end
    object Label7: TLabel
      Left = 56
      Top = 38
      Width = 113
      Height = 13
      AutoSize = False
      Caption = '전자명세서 종류 : '
    end
    object GroupBox2: TGroupBox
      Left = 568
      Top = 16
      Width = 201
      Height = 145
      Caption = '임시저장 후 발행 프로세스'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Shape11: TShape
        Left = 144
        Top = 40
        Width = 2
        Height = 81
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape2: TShape
        Left = 47
        Top = 48
        Width = 2
        Height = 73
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape9: TShape
        Left = 45
        Top = 116
        Width = 100
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape1: TShape
        Left = 16
        Top = 16
        Width = 177
        Height = 33
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
      object Label6: TLabel
        Left = 24
        Top = 26
        Width = 52
        Height = 12
        Caption = '임시저장'
        Color = clAppWorkSpace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = '굴림'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object btnRegister: TButton
        Left = 80
        Top = 20
        Width = 33
        Height = 25
        Caption = '등록'
        TabOrder = 0
        OnClick = btnRegisterClick
      end
      object btnUpdate: TButton
        Left = 120
        Top = 20
        Width = 33
        Height = 25
        Caption = '수정'
        TabOrder = 1
        OnClick = btnUpdateClick
      end
      object btnCancel_Issue: TButton
        Left = 16
        Top = 104
        Width = 60
        Height = 25
        Caption = '취소'
        TabOrder = 2
        OnClick = btnCancel_IssueClick
      end
      object btnDelete: TButton
        Left = 108
        Top = 104
        Width = 65
        Height = 25
        Caption = '삭제'
        TabOrder = 3
        OnClick = btnDeleteClick
      end
      object btnIssue: TButton
        Left = 16
        Top = 58
        Width = 60
        Height = 25
        Caption = '발행'
        TabOrder = 4
        OnClick = btnIssueClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 24
      Top = 192
      Width = 129
      Height = 161
      Caption = '첨부파일'
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 84
        Width = 89
        Height = 13
        AutoSize = False
        Caption = '삭제할 파일ID:'
      end
      object btnGetFileList: TButton
        Left = 8
        Top = 56
        Width = 105
        Height = 25
        Caption = '첨부파일 목록'
        TabOrder = 0
        OnClick = btnGetFileListClick
      end
      object btnAttachFile: TButton
        Left = 8
        Top = 24
        Width = 105
        Height = 25
        Caption = '파일 첨부'
        TabOrder = 1
        OnClick = btnAttachFileClick
      end
      object btnDeleteFile: TButton
        Left = 8
        Top = 124
        Width = 105
        Height = 25
        Caption = '첨부파일 삭제'
        TabOrder = 2
        OnClick = btnDeleteFileClick
      end
      object tbFileIndexID: TEdit
        Left = 8
        Top = 98
        Width = 105
        Height = 21
        ImeName = '한국어 입력 시스템 (IME 2000)'
        TabOrder = 3
      end
    end
    object GroupBox5: TGroupBox
      Left = 176
      Top = 192
      Width = 137
      Height = 161
      Caption = '문서 정보'
      TabOrder = 2
      object btnGetDetailInfo: TButton
        Left = 8
        Top = 121
        Width = 120
        Height = 25
        Caption = '문서상세정보'
        TabOrder = 0
        OnClick = btnGetDetailInfoClick
      end
      object btnGetLogs: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = '문서이력'
        TabOrder = 1
        OnClick = btnGetLogsClick
      end
      object btnGetInfo: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = '문서정보'
        TabOrder = 2
        OnClick = btnGetInfoClick
      end
      object btnGetInfos: TButton
        Left = 8
        Top = 56
        Width = 120
        Height = 25
        Caption = '문서정보(대량)'
        TabOrder = 3
        OnClick = btnGetInfosClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 328
      Top = 192
      Width = 129
      Height = 161
      Caption = '부가서비스'
      TabOrder = 3
      object btnReSendEmail: TButton
        Left = 8
        Top = 24
        Width = 112
        Height = 25
        Caption = '이메일 전송'
        TabOrder = 0
        OnClick = btnReSendEmailClick
      end
      object btnReSendSMS: TButton
        Left = 8
        Top = 56
        Width = 112
        Height = 25
        Caption = '문자 전송'
        TabOrder = 1
        OnClick = btnReSendSMSClick
      end
      object btnSendInvoiceFax: TButton
        Left = 8
        Top = 88
        Width = 112
        Height = 25
        Caption = '팩스 전송'
        TabOrder = 2
        OnClick = btnSendInvoiceFaxClick
      end
      object btnIssueFax: TButton
        Left = 8
        Top = 120
        Width = 113
        Height = 25
        Caption = '선팩스 전송'
        TabOrder = 3
        OnClick = btnIssueFaxClick
      end
    end
    object tbMgtKey: TEdit
      Left = 168
      Top = 90
      Width = 137
      Height = 21
      ImeName = '한국어 입력 시스템 (IME 2000)'
      TabOrder = 4
    end
    object btnCheckMgtKeyInUse: TButton
      Left = 169
      Top = 114
      Width = 160
      Height = 23
      Caption = '관리번호 사용여부 확인'
      TabOrder = 5
      OnClick = btnCheckMgtKeyInUseClick
    end
    object GroupBox10: TGroupBox
      Left = 664
      Top = 192
      Width = 145
      Height = 161
      Caption = '기타  URL'
      TabOrder = 6
      object btnGetTaxinvoiceURL1: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '임시(연동) 문서함'
        TabOrder = 0
        OnClick = btnGetTaxinvoiceURL1Click
      end
      object btnGetTaxinvoiceURL2: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '발행 문서함'
        TabOrder = 1
        OnClick = btnGetTaxinvoiceURL2Click
      end
    end
    object cbItemCode: TComboBox
      Left = 168
      Top = 34
      Width = 121
      Height = 21
      ImeName = 'Microsoft IME 2010'
      ItemHeight = 13
      TabOrder = 7
      Text = '거래명세서'
      OnChange = cbItemCodeChange
      Items.Strings = (
        '거래명세서'
        '청구서'
        '견적서'
        '발주서'
        '입금표'
        '영수증')
    end
    object txtFormCode: TEdit
      Left = 168
      Top = 64
      Width = 137
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 8
    end
    object GroupBox15: TGroupBox
      Left = 344
      Top = 16
      Width = 193
      Height = 145
      Caption = '즉시발행 프로세스 '
      TabOrder = 9
      object Shape3: TShape
        Left = 8
        Top = 28
        Width = 177
        Height = 33
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
      object Shape4: TShape
        Left = 53
        Top = 48
        Width = 2
        Height = 50
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape5: TShape
        Left = 76
        Top = 106
        Width = 50
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object btnRegistIssue: TButton
        Left = 16
        Top = 32
        Width = 75
        Height = 25
        Caption = '즉시발행'
        TabOrder = 0
        OnClick = btnRegistIssueClick
      end
      object btnCancel: TButton
        Left = 16
        Top = 96
        Width = 75
        Height = 25
        Caption = '취소'
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnDelete_registIssue: TButton
        Left = 112
        Top = 96
        Width = 65
        Height = 25
        Caption = '삭제'
        TabOrder = 2
        OnClick = btnDelete_registIssueClick
      end
    end
  end
  object GroupBox8: TGroupBox
    Left = 16
    Top = 40
    Width = 825
    Height = 169
    Caption = '팝빌 기본 API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 121
      Height = 129
      Caption = '회원 정보'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 105
        Height = 25
        Caption = '회원 가입'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 105
        Height = 25
        Caption = 'ID 중복 확인'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 105
        Height = 25
        Caption = '가입여부확인'
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 160
      Top = 24
      Width = 145
      Height = 129
      Caption = '포인트 관련'
      TabOrder = 1
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '잔여포인트 확인'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetUnitCost: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '요금 단가 확인'
        TabOrder = 1
        OnClick = btnGetUnitCostClick
      end
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = '파트너포인트 확인'
        TabOrder = 2
        OnClick = btnGetPartnerBalanceClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 328
      Top = 24
      Width = 153
      Height = 129
      Caption = '팝빌 기본 URL'
      TabOrder = 2
      object btnGetPopBillURL: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '팝빌 로그인 URL'
        TabOrder = 0
        OnClick = btnGetPopBillURLClick
      end
      object btnGetPopbillURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '포인트 충전 URL'
        TabOrder = 1
        OnClick = btnGetPopbillURL_CHRGClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 504
      Top = 24
      Width = 145
      Height = 129
      Caption = '담당자 관련'
      TabOrder = 3
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '담당자 추가'
        TabOrder = 0
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '담당자 목록 조회'
        TabOrder = 1
        OnClick = btnListContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 88
        Width = 121
        Height = 25
        Caption = '담당자 정보 수정'
        TabOrder = 2
        OnClick = btnUpdateContactClick
      end
    end
    object GroupBox14: TGroupBox
      Left = 672
      Top = 24
      Width = 129
      Height = 129
      Caption = '회사정보 관련'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 113
        Height = 25
        Caption = '회사정보 조회'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 113
        Height = 25
        Caption = '회사정보 수정'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
  end
  object GroupBox7: TGroupBox
    Left = 488
    Top = 416
    Width = 177
    Height = 193
    Caption = ' 문서관련 URL기능'
    TabOrder = 2
    object btnGetPopUpURL: TButton
      Left = 8
      Top = 24
      Width = 161
      Height = 25
      Caption = '문서 내용보기 팝업 URL'
      TabOrder = 0
      OnClick = btnGetPopUpURLClick
    end
    object btnGetPrintURL: TButton
      Left = 8
      Top = 56
      Width = 161
      Height = 25
      Caption = '인쇄 팝업 URL'
      TabOrder = 1
      OnClick = btnGetPrintURLClick
    end
    object btnGetPrintsURL: TButton
      Left = 8
      Top = 120
      Width = 161
      Height = 25
      Caption = '대량인쇄 팝업 URL'
      TabOrder = 2
      OnClick = btnGetPrintsURLClick
    end
    object btnGetMailURL: TButton
      Left = 8
      Top = 152
      Width = 161
      Height = 25
      Caption = '이메일의 보기버튼 URL'
      TabOrder = 3
      OnClick = btnGetMailURLClick
    end
    object Button1: TButton
      Left = 8
      Top = 88
      Width = 161
      Height = 25
      Caption = '수신자 인쇄 팝업 URL'
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object txtCorpNum: TEdit
    Left = 152
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 3
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 408
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 4
    Text = 'testkorea'
  end
  object OpenDialog1: TOpenDialog
    Left = 728
    Top = 8
  end
end
