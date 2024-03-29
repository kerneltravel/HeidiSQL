object UserManagerForm: TUserManagerForm
  Left = 252
  Top = 131
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'User Manager'
  ClientHeight = 364
  ClientWidth = 484
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 8
  Padding.Top = 8
  Padding.Right = 8
  Padding.Bottom = 40
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    484
    364)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 185
    Top = 8
    Width = 5
    Height = 316
    ResizeStyle = rsUpdate
  end
  object lblWarning: TLabel
    Left = 8
    Top = 330
    Width = 192
    Height = 30
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object btnCancel: TButton
    Left = 391
    Top = 332
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    ImageIndex = 26
    Images = MainForm.ImageListMain
    ModalResult = 2
    TabOrder = 4
  end
  object btnSave: TButton
    Left = 209
    Top = 332
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Save'
    Default = True
    ImageIndex = 10
    Images = MainForm.ImageListMain
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object pnlLeft: TPanel
    Left = 8
    Top = 8
    Width = 177
    Height = 316
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MinWidth = 20
    TabOrder = 0
    object lblUsers: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 171
      Height = 13
      Align = alTop
      Caption = '&Select user account:'
      FocusControl = listUsers
    end
    object listUsers: TVirtualStringTree
      Left = 0
      Top = 41
      Width = 177
      Height = 275
      Align = alClient
      Header.AutoSizeIndex = 0
      Header.Options = [hoAutoResize, hoColumnResize, hoDblClickResize, hoDrag, hoHotTrack, hoShowSortGlyphs, hoVisible]
      Header.ParentFont = True
      Header.SortColumn = 0
      Images = MainForm.ImageListMain
      IncrementalSearch = isAll
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoDeleteMovedNodes]
      TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowTreeLines, toThemeAware, toUseBlendedImages, toUseExplorerTheme, toHideTreeLinesIfThemed]
      TreeOptions.SelectionOptions = [toFullRowSelect]
      OnAfterPaint = listUsersAfterPaint
      OnBeforePaint = listUsersBeforePaint
      OnCompareNodes = listUsersCompareNodes
      OnFocusChanged = listUsersFocusChanged
      OnFocusChanging = listUsersFocusChanging
      OnGetText = listUsersGetText
      OnGetImageIndex = listUsersGetImageIndex
      OnGetNodeDataSize = listUsersGetNodeDataSize
      OnHeaderClick = listUsersHeaderClick
      OnHotChange = listUsersHotChange
      OnInitNode = listUsersInitNode
      Columns = <
        item
          Position = 0
          Width = 93
          WideText = 'Username'
        end
        item
          Position = 1
          Width = 80
          WideText = 'Host'
        end>
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 19
      Width = 177
      Height = 22
      AutoSize = True
      ButtonWidth = 58
      Caption = 'ToolBar1'
      Images = MainForm.ImageListMain
      List = True
      ShowCaptions = True
      TabOrder = 1
      Wrapable = False
      object btnAddUser: TToolButton
        Left = 0
        Top = 0
        Caption = 'Add'
        ImageIndex = 45
        OnClick = btnAddUserClick
      end
      object btnCloneUser: TToolButton
        Left = 58
        Top = 0
        Caption = 'Clone'
        ImageIndex = 3
        OnClick = btnAddUserClick
      end
      object btnDeleteUser: TToolButton
        Left = 116
        Top = 0
        Caption = 'Delete'
        ImageIndex = 46
        OnClick = btnDeleteUserClick
      end
    end
  end
  object pnlRight: TPanel
    Left = 190
    Top = 8
    Width = 286
    Height = 316
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinWidth = 20
    TabOrder = 1
    object tlbObjects: TToolBar
      Left = 0
      Top = 145
      Width = 286
      Height = 22
      AutoSize = True
      ButtonWidth = 79
      Caption = 'tlbObjects'
      Images = MainForm.ImageListMain
      List = True
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 1
      Wrapable = False
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 89
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Allow access to:'
        Transparent = False
        Layout = tlCenter
      end
      object btnAddObject: TToolButton
        Left = 89
        Top = 0
        Hint = 'Add object ...'
        Caption = 'Add object'
        ImageIndex = 45
        OnClick = btnAddObjectClick
      end
    end
    object treePrivs: TVirtualStringTree
      Left = 0
      Top = 167
      Width = 286
      Height = 149
      Align = alClient
      Header.AutoSizeIndex = 0
      Header.MainColumn = -1
      Header.ParentFont = True
      Images = MainForm.ImageListMain
      IncrementalSearch = isAll
      TabOrder = 2
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
      TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
      TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowRoot, toShowTreeLines, toThemeAware, toUseBlendedImages, toUseExplorerTheme, toHideTreeLinesIfThemed]
      OnChecked = treePrivsChecked
      OnExpanded = treePrivsExpanded
      OnGetText = treePrivsGetText
      OnPaintText = treePrivsPaintText
      OnGetImageIndex = treePrivsGetImageIndex
      OnInitChildren = treePrivsInitChildren
      OnInitNode = treePrivsInitNode
      Columns = <>
    end
    object PageControlSettings: TPageControl
      Left = 0
      Top = 0
      Width = 286
      Height = 145
      ActivePage = tabCredentials
      Align = alTop
      TabOrder = 0
      object tabCredentials: TTabSheet
        Caption = 'Credentials'
        DesignSize = (
          278
          117)
        object lblUsername: TLabel
          Left = 3
          Top = 10
          Width = 55
          Height = 13
          Caption = 'User &name:'
        end
        object lblFromHost: TLabel
          Left = 3
          Top = 37
          Width = 52
          Height = 13
          Caption = 'From &host:'
          FocusControl = editFromHost
        end
        object lblPassword: TLabel
          Left = 3
          Top = 64
          Width = 50
          Height = 13
          Caption = '&Password:'
          FocusControl = editPassword
        end
        object lblRepeatPassword: TLabel
          Left = 3
          Top = 91
          Width = 88
          Height = 13
          Caption = 'Repeat password:'
          FocusControl = editRepeatPassword
        end
        object editRepeatPassword: TEdit
          Left = 106
          Top = 88
          Width = 169
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          PasswordChar = '*'
          TabOrder = 3
          OnChange = Modification
        end
        object editPassword: TButtonedEdit
          Left = 106
          Top = 61
          Width = 169
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = MainForm.ImageListMain
          PasswordChar = '*'
          RightButton.DropDownMenu = menuPassword
          RightButton.Hint = 'Select random password'
          RightButton.ImageIndex = 75
          RightButton.Visible = True
          TabOrder = 2
          OnChange = editPasswordChange
        end
        object editFromHost: TButtonedEdit
          Left = 106
          Top = 34
          Width = 169
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = MainForm.ImageListMain
          RightButton.DropDownMenu = menuHost
          RightButton.ImageIndex = 75
          RightButton.Visible = True
          TabOrder = 1
          OnChange = Modification
        end
        object editUsername: TEdit
          Left = 106
          Top = 7
          Width = 169
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = Modification
        end
      end
      object tabLimitations: TTabSheet
        Caption = 'Limitations'
        ImageIndex = 1
        DesignSize = (
          278
          117)
        object lblMaxQueries: TLabel
          Left = 3
          Top = 10
          Width = 85
          Height = 13
          Caption = 'Queries per hour:'
        end
        object lblMaxUpdates: TLabel
          Left = 3
          Top = 37
          Width = 88
          Height = 13
          Caption = 'Updates per hour:'
        end
        object lblMaxConnections: TLabel
          Left = 3
          Top = 64
          Width = 107
          Height = 13
          Caption = 'Connections per hour:'
        end
        object lblMaxUserConnections: TLabel
          Left = 3
          Top = 91
          Width = 127
          Height = 13
          Caption = 'Simultaneous connections:'
        end
        object editMaxQueries: TEdit
          Left = 162
          Top = 7
          Width = 97
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          NumbersOnly = True
          TabOrder = 0
          Text = '0'
          OnChange = Modification
        end
        object editMaxUpdates: TEdit
          Left = 162
          Top = 34
          Width = 97
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          NumbersOnly = True
          TabOrder = 2
          Text = '0'
          OnChange = Modification
        end
        object editMaxConnections: TEdit
          Left = 162
          Top = 61
          Width = 97
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          NumbersOnly = True
          TabOrder = 4
          Text = '0'
          OnChange = Modification
        end
        object editMaxUserConnections: TEdit
          Left = 162
          Top = 88
          Width = 97
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          NumbersOnly = True
          TabOrder = 6
          Text = '0'
          OnChange = Modification
        end
        object udMaxQueries: TUpDown
          Left = 259
          Top = 7
          Width = 17
          Height = 21
          Anchors = [akTop, akRight]
          Associate = editMaxQueries
          Max = 2147483647
          TabOrder = 1
          Thousands = False
          OnClick = udMaxQueriesClick
        end
        object udMaxUpdates: TUpDown
          Left = 259
          Top = 34
          Width = 17
          Height = 21
          Anchors = [akTop, akRight]
          Associate = editMaxUpdates
          Max = 2147483647
          TabOrder = 3
          Thousands = False
        end
        object udMaxConnections: TUpDown
          Left = 259
          Top = 61
          Width = 17
          Height = 21
          Anchors = [akTop, akRight]
          Associate = editMaxConnections
          Max = 2147483647
          TabOrder = 5
          Thousands = False
        end
        object udMaxUserConnections: TUpDown
          Left = 259
          Top = 88
          Width = 17
          Height = 21
          Anchors = [akTop, akRight]
          Associate = editMaxUserConnections
          Max = 2147483647
          TabOrder = 7
          Thousands = False
        end
      end
      object tabSSL: TTabSheet
        Caption = 'SSL options'
        ImageIndex = 2
        DesignSize = (
          278
          117)
        object lblCipher: TLabel
          Left = 3
          Top = 36
          Width = 35
          Height = 13
          Caption = '&Cipher:'
          FocusControl = editCipher
        end
        object lblIssuer: TLabel
          Left = 3
          Top = 62
          Width = 34
          Height = 13
          Caption = '&Issuer:'
          FocusControl = editIssuer
        end
        object lblSubject: TLabel
          Left = 3
          Top = 89
          Width = 40
          Height = 13
          Caption = '&Subject:'
          FocusControl = editSubject
        end
        object lblSSL: TLabel
          Left = 3
          Top = 9
          Width = 61
          Height = 13
          Caption = '&Require SSL:'
        end
        object editCipher: TEdit
          Left = 106
          Top = 33
          Width = 169
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Text = 'editCipher'
          OnChange = Modification
        end
        object editIssuer: TEdit
          Left = 106
          Top = 59
          Width = 169
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Text = 'editIssuer'
          OnChange = Modification
        end
        object editSubject: TEdit
          Left = 106
          Top = 86
          Width = 169
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Text = 'editSubject'
          OnChange = Modification
        end
        object comboSSL: TComboBox
          Left = 106
          Top = 6
          Width = 169
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = comboSSLChange
          Items.Strings = (
            'No SSL or X509 requirements'
            'Only permit SSL-encrypted connections'
            'X509 (certificate, issuer and subject do not matter)'
            'Specify requirements...')
        end
      end
    end
  end
  object btnDiscard: TButton
    Left = 300
    Top = 332
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Discard'
    ImageIndex = 40
    Images = MainForm.ImageListMain
    TabOrder = 3
    OnClick = btnDiscardClick
  end
  object menuHost: TPopupMenu
    OnPopup = menuHostPopup
    Left = 16
    Top = 280
    object menuHost1: TMenuItem
      Caption = 'Access from server location only'
      Hint = 'localhost'
      OnClick = menuHostClick
    end
    object menuHost2: TMenuItem
      Caption = 'Local network: 192.168.%'
      Hint = '192.168.%'
      OnClick = menuHostClick
    end
    object menuHost3: TMenuItem
      Caption = 'Local network: 10.122.%'
      Hint = '10.122.%'
      OnClick = menuHostClick
    end
    object menuHostLocal4: TMenuItem
      Caption = 'Access from everywhere'
      Hint = '%'
      OnClick = menuHostClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
  end
  object menuPassword: TPopupMenu
    AutoHotkeys = maManual
    Left = 48
    Top = 280
    object menuPassword1: TMenuItem
      Caption = '6 characters'
      OnClick = menuPasswordClick
      object menuDummy1: TMenuItem
        Caption = 'dummy'
        OnClick = menuPasswordInsert
      end
    end
    object menuPassword2: TMenuItem
      Caption = '8 characters'
      OnClick = menuPasswordClick
      object menuDummy2: TMenuItem
        Caption = 'dummy'
        OnClick = menuPasswordInsert
      end
    end
    object menuPassword3: TMenuItem
      Caption = '10 characters'
      OnClick = menuPasswordClick
      object menuDummy3: TMenuItem
        Caption = 'dummy'
        OnClick = menuPasswordInsert
      end
    end
    object menuPassword4: TMenuItem
      Caption = '12 characters'
      OnClick = menuPasswordClick
      object menuDummy4: TMenuItem
        Caption = 'dummy'
        OnClick = menuPasswordInsert
      end
    end
    object menuPassword5: TMenuItem
      Caption = '30 characters'
      OnClick = menuPasswordClick
      object menuDummy5: TMenuItem
        Caption = 'dummy'
        OnClick = menuPasswordInsert
      end
    end
  end
end
