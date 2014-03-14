<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.trbRate = New System.Windows.Forms.TrackBar
        Me.lblRate = New System.Windows.Forms.Label
        CType(Me.trbRate, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Timer1
        '
        Me.Timer1.Interval = 750
        '
        'trbRate
        '
        Me.trbRate.LargeChange = 2
        Me.trbRate.Location = New System.Drawing.Point(12, 12)
        Me.trbRate.Maximum = 21
        Me.trbRate.Name = "trbRate"
        Me.trbRate.Size = New System.Drawing.Size(493, 45)
        Me.trbRate.TabIndex = 0
        Me.trbRate.Value = 2
        '
        'lblRate
        '
        Me.lblRate.AutoSize = True
        Me.lblRate.Location = New System.Drawing.Point(13, 64)
        Me.lblRate.Name = "lblRate"
        Me.lblRate.Size = New System.Drawing.Size(157, 13)
        Me.lblRate.TabIndex = 1
        Me.lblRate.Text = "Transfear rate: 750 Milliseconds"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(517, 89)
        Me.ControlBox = False
        Me.Controls.Add(Me.lblRate)
        Me.Controls.Add(Me.trbRate)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "Form1"
        Me.Text = "Local Internet Mode running..."
        CType(Me.trbRate, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents trbRate As System.Windows.Forms.TrackBar
    Friend WithEvents lblRate As System.Windows.Forms.Label

End Class
