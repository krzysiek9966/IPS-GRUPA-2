   M S B A M L   `   `   `  ����D  @DBUplader, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:DBUplader	DBUplader  5   	   H DMahApps.Metro, Version=1.6.5.1, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5   	       DBUplader.MainWindow   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:DBUplader     5   	   PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5   	   (  "MahApps.Metro.Controls.MetroWindow    ShowTitleBar  .     ShowMaxRestoreButton .     ShowMinButton .     AccentColorBrush   	GlowBrush# �   5   	    � Title$	 IPS��5   	   $	��400��6   $	��600��6"   .��5      �  � ColumnDefinitions 5   
   �� 5      6!   �� 5      6!   �� 5      $��30 �6   6,   �� 5      6!   �� 5      6!    � RowDefinitions 5   
   �� 5      6   �� 5      $��30 �6   6*   �� 5      6   �� 5      $��30 �6   6*   �� 5      6   �� 5      $��30 �6   6*   �� 5      6   .+�5!   
   �� -   5        $��	BsonToMDB��5!      $��2��6:   $��1��6G   $��5,5,5,5q�6W   ��5"      �� 5#      $
��Wrap=�6   $��CSV TO MONGODB��60   5%      �� 5&   
   -   5        $��CSVToCH��5&      $��2��66   $��0��6C   $��5,5,5,5q�6S   ��5'      �� 5(      $
��Wrap=�6   $��CSV TO CLICKHOUSE��60   5*      �� 5+   
   $3��-ClickHouse MongoDB data import and migrations��6   $��Center=�6H   $��Center=�6c   $��0��6�   $��1��6�   $��3��6�   �� 5,   
   $��Import CSV data to DB��6   $��1��60   $��0��6=   $��2��6M   $��Center=�6a   �� 5-   
   $��Migrate data��6   $��3��6'   $��0��64   $��2��6D   $��Center=�6X   �� 5.   
   -   5        $��CHToMDB��5.      $��1��66   $��4��6F   $��5,5,5,5q�6S   ��5/      �� 50      $
��Wrap=�6   $��CLICKHOUSE TO MONGODB��60   52      �� 53   
   -   5        $��MDBToCH��53      $��0��67   $��4��6G   $��5,5,5,5q�6T   ��54      �� 55      $
��Wrap=�6   $��MONGODB TO CLICKHOUSE��60   57      �� 58   
   -   5        $
��Logs��58      $��4��61   $��6��6A   $��5,5,5,5q�6N   ��59      �� 5:      $
��Wrap=�6   $
��LOGS��60   5<      �� 5?   
   -   5        $��	CHPreview��5?      $��4��6;   $��2��6K   $��5,5,5,5q�6X   ��5@      �� 5A      $
��Wrap=�6   $��CLICKHOUSE PREVIEW��60   5C      �� 5D   
   -   5        $��
MDBPreview��5D      $��3��6=   $��2��6M   $��5,5,5,5q�6Z   ��5E      �� 5F      $
��Wrap=�6   $��MONGODB PREVIEW��60   5H      �� 5I   
   -   5        $��CHCommander��5I      $��4��6>   $��4��6N   $��5,5,5,5q�6[   ��5J      �� 5K      $
��Wrap=�6   $��CLICKHOUSE COMMANDER��60   5M      �� 5N   
   -	   5        $��MDBCommander��5N      $��3��6A   $��4��6Q   $��5,5,5,5q�6^   ��5O      �� 5P      $
��Wrap=�6   $��MONGODB COMMANDER��60   5R      5S      5T      