object frmExample: TfrmExample
  Left = 412
  Top = 185
  Width = 870
  Height = 672
  Caption = '�˺� ���ڸ��� SDK Example'
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
    Caption = '�˺�ȸ�� ����ڹ�ȣ : '
  end
  object Label4: TLabel
    Left = 304
    Top = 12
    Width = 96
    Height = 13
    Caption = '�˺�ȸ�� ���̵� : '
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 224
    Width = 825
    Height = 393
    Caption = '���ڸ��� ���� API'
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 94
      Width = 129
      Height = 13
      AutoSize = False
      Caption = '����������ȣ(MgtKey) :'
    end
    object Label5: TLabel
      Left = 48
      Top = 70
      Width = 121
      Height = 13
      AutoSize = False
      Caption = '����ڵ�(FormCode) :'
    end
    object Label7: TLabel
      Left = 56
      Top = 38
      Width = 113
      Height = 13
      AutoSize = False
      Caption = '���ڸ��� ���� : '
    end
    object GroupBox2: TGroupBox
      Left = 568
      Top = 16
      Width = 201
      Height = 145
      Caption = '�ӽ����� �� ���� ���μ���'
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
        Caption = '�ӽ�����'
        Color = clAppWorkSpace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = '����'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object btnRegister: TButton
        Left = 80
        Top = 20
        Width = 33
        Height = 25
        Caption = '���'
        TabOrder = 0
        OnClick = btnRegisterClick
      end
      object btnUpdate: TButton
        Left = 120
        Top = 20
        Width = 33
        Height = 25
        Caption = '����'
        TabOrder = 1
        OnClick = btnUpdateClick
      end
      object btnCancel_Issue: TButton
        Left = 16
        Top = 104
        Width = 60
        Height = 25
        Caption = '���'
        TabOrder = 2
        OnClick = btnCancel_IssueClick
      end
      object btnDelete: TButton
        Left = 108
        Top = 104
        Width = 65
        Height = 25
        Caption = '����'
        TabOrder = 3
        OnClick = btnDeleteClick
      end
      object btnIssue: TButton
        Left = 16
        Top = 58
        Width = 60
        Height = 25
        Caption = '����'
        TabOrder = 4
        OnClick = btnIssueClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 24
      Top = 192
      Width = 129
      Height = 161
      Caption = '÷������'
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 84
        Width = 89
        Height = 13
        AutoSize = False
        Caption = '������ ����ID:'
      end
      object btnGetFileList: TButton
        Left = 8
        Top = 56
        Width = 105
        Height = 25
        Caption = '÷������ ���'
        TabOrder = 0
        OnClick = btnGetFileListClick
      end
      object btnAttachFile: TButton
        Left = 8
        Top = 24
        Width = 105
        Height = 25
        Caption = '���� ÷��'
        TabOrder = 1
        OnClick = btnAttachFileClick
      end
      object btnDeleteFile: TButton
        Left = 8
        Top = 124
        Width = 105
        Height = 25
        Caption = '÷������ ����'
        TabOrder = 2
        OnClick = btnDeleteFileClick
      end
      object tbFileIndexID: TEdit
        Left = 8
        Top = 98
        Width = 105
        Height = 21
        ImeName = '�ѱ��� �Է� �ý��� (IME 2000)'
        TabOrder = 3
      end
    end
    object GroupBox5: TGroupBox
      Left = 176
      Top = 192
      Width = 137
      Height = 161
      Caption = '���� ����'
      TabOrder = 2
      object btnGetDetailInfo: TButton
        Left = 8
        Top = 121
        Width = 120
        Height = 25
        Caption = '����������'
        TabOrder = 0
        OnClick = btnGetDetailInfoClick
      end
      object btnGetLogs: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = '�����̷�'
        TabOrder = 1
        OnClick = btnGetLogsClick
      end
      object btnGetInfo: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = '��������'
        TabOrder = 2
        OnClick = btnGetInfoClick
      end
      object btnGetInfos: TButton
        Left = 8
        Top = 56
        Width = 120
        Height = 25
        Caption = '��������(�뷮)'
        TabOrder = 3
        OnClick = btnGetInfosClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 328
      Top = 192
      Width = 129
      Height = 161
      Caption = '�ΰ�����'
      TabOrder = 3
      object btnReSendEmail: TButton
        Left = 8
        Top = 24
        Width = 112
        Height = 25
        Caption = '�̸��� ����'
        TabOrder = 0
        OnClick = btnReSendEmailClick
      end
      object btnReSendSMS: TButton
        Left = 8
        Top = 56
        Width = 112
        Height = 25
        Caption = '���� ����'
        TabOrder = 1
        OnClick = btnReSendSMSClick
      end
      object btnSendInvoiceFax: TButton
        Left = 8
        Top = 88
        Width = 112
        Height = 25
        Caption = '�ѽ� ����'
        TabOrder = 2
        OnClick = btnSendInvoiceFaxClick
      end
      object btnIssueFax: TButton
        Left = 8
        Top = 120
        Width = 113
        Height = 25
        Caption = '���ѽ� ����'
        TabOrder = 3
        OnClick = btnIssueFaxClick
      end
    end
    object tbMgtKey: TEdit
      Left = 168
      Top = 90
      Width = 137
      Height = 21
      ImeName = '�ѱ��� �Է� �ý��� (IME 2000)'
      TabOrder = 4
    end
    object btnCheckMgtKeyInUse: TButton
      Left = 169
      Top = 114
      Width = 160
      Height = 23
      Caption = '������ȣ ��뿩�� Ȯ��'
      TabOrder = 5
      OnClick = btnCheckMgtKeyInUseClick
    end
    object GroupBox10: TGroupBox
      Left = 664
      Top = 192
      Width = 145
      Height = 161
      Caption = '��Ÿ  URL'
      TabOrder = 6
      object btnGetTaxinvoiceURL1: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '�ӽ�(����) ������'
        TabOrder = 0
        OnClick = btnGetTaxinvoiceURL1Click
      end
      object btnGetTaxinvoiceURL2: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '���� ������'
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
      Text = '�ŷ�����'
      OnChange = cbItemCodeChange
      Items.Strings = (
        '�ŷ�����'
        'û����'
        '������'
        '���ּ�'
        '�Ա�ǥ'
        '������')
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
      Caption = '��ù��� ���μ��� '
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
        Caption = '��ù���'
        TabOrder = 0
        OnClick = btnRegistIssueClick
      end
      object btnCancel: TButton
        Left = 16
        Top = 96
        Width = 75
        Height = 25
        Caption = '���'
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnDelete_registIssue: TButton
        Left = 112
        Top = 96
        Width = 65
        Height = 25
        Caption = '����'
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
    Caption = '�˺� �⺻ API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 121
      Height = 129
      Caption = 'ȸ�� ����'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 105
        Height = 25
        Caption = 'ȸ�� ����'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 105
        Height = 25
        Caption = 'ID �ߺ� Ȯ��'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 105
        Height = 25
        Caption = '���Կ���Ȯ��'
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 160
      Top = 24
      Width = 145
      Height = 129
      Caption = '����Ʈ ����'
      TabOrder = 1
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '�ܿ�����Ʈ Ȯ��'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetUnitCost: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '��� �ܰ� Ȯ��'
        TabOrder = 1
        OnClick = btnGetUnitCostClick
      end
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = '��Ʈ������Ʈ Ȯ��'
        TabOrder = 2
        OnClick = btnGetPartnerBalanceClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 328
      Top = 24
      Width = 153
      Height = 129
      Caption = '�˺� �⺻ URL'
      TabOrder = 2
      object btnGetPopBillURL: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '�˺� �α��� URL'
        TabOrder = 0
        OnClick = btnGetPopBillURLClick
      end
      object btnGetPopbillURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '����Ʈ ���� URL'
        TabOrder = 1
        OnClick = btnGetPopbillURL_CHRGClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 504
      Top = 24
      Width = 145
      Height = 129
      Caption = '����� ����'
      TabOrder = 3
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '����� �߰�'
        TabOrder = 0
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '����� ��� ��ȸ'
        TabOrder = 1
        OnClick = btnListContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 88
        Width = 121
        Height = 25
        Caption = '����� ���� ����'
        TabOrder = 2
        OnClick = btnUpdateContactClick
      end
    end
    object GroupBox14: TGroupBox
      Left = 672
      Top = 24
      Width = 129
      Height = 129
      Caption = 'ȸ������ ����'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 113
        Height = 25
        Caption = 'ȸ������ ��ȸ'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 113
        Height = 25
        Caption = 'ȸ������ ����'
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
    Caption = ' �������� URL���'
    TabOrder = 2
    object btnGetPopUpURL: TButton
      Left = 8
      Top = 24
      Width = 161
      Height = 25
      Caption = '���� ���뺸�� �˾� URL'
      TabOrder = 0
      OnClick = btnGetPopUpURLClick
    end
    object btnGetPrintURL: TButton
      Left = 8
      Top = 56
      Width = 161
      Height = 25
      Caption = '�μ� �˾� URL'
      TabOrder = 1
      OnClick = btnGetPrintURLClick
    end
    object btnGetPrintsURL: TButton
      Left = 8
      Top = 120
      Width = 161
      Height = 25
      Caption = '�뷮�μ� �˾� URL'
      TabOrder = 2
      OnClick = btnGetPrintsURLClick
    end
    object btnGetMailURL: TButton
      Left = 8
      Top = 152
      Width = 161
      Height = 25
      Caption = '�̸����� �����ư URL'
      TabOrder = 3
      OnClick = btnGetMailURLClick
    end
    object Button1: TButton
      Left = 8
      Top = 88
      Width = 161
      Height = 25
      Caption = '������ �μ� �˾� URL'
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
