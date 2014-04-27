'''
'
' Solution to Android crackme03 by deuru.
' http://crackmes.de/users/deurus/android_crackme03/
' 
' 2014/04/27
' spageek.net
'
'''


Module Module1

    Sub Main()
        Console.write("deviceID (HardwareID 01): ")
        Dim deviceId As String = Console.ReadLine
        Console.write("deviceID (HardwareID 02): ")
        Dim simSerialNumber As String = Console.ReadLine
        Console.Write("Name: ")
        Dim str As String = Console.ReadLine
        Dim str2 As String = ""
        Dim length1 As Integer = str.Length

        If length1 < 4 Then
            Console.WriteLine("Min 4 chars")
            End
        End If

        Dim n As Integer = 0

        While True

            Dim length2 As Integer = str.Length

            If n < length2 Then
                Try
                    Dim value As String = 438294 Xor Integer.Parse(str2.Substring(0, 5))
                    Dim substring As String = deviceId.Substring(0, 6)
                    Dim substring2 As String = simSerialNumber.Substring(0, 6)
                    Dim n2 As Long = Integer.Parse(substring) Xor Integer.Parse(substring2)

                    Console.WriteLine(value & "-" & n2 & "-" & substring)

                    Console.Read()

                    End

                Catch ex As Exception : End Try

                Try
                    Dim cha() As Char = str.ToCharArray
                    Dim char1 As Char = cha(n)
                    str2 &= Asc(char1)
                Catch ex As Exception : End Try

            End If

            n += 1

        End While

    End Sub

End Module
