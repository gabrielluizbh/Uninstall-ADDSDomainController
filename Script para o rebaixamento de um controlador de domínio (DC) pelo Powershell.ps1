# Script para o rebaixamento de um controlador de domínio (DC) pelo Powershell - Créditos Gabriel Luiz - www.gabrielluiz.com #



# Executa os pré-requisitos para o rebaixamento de um controlador de domínio no Active Directory.




Test-ADDSDomainControllerUninstallation -localadministratorpassword (convertto-securestring "@abc123" -asplaintext -force)



<#


Explicação do comando: Test-ADDSDomainControllerUninstallation -localadministratorpassword (convertto-securestring "@abc123" -asplaintext -force)


Test-ADDSDomainControllerUninstallation - Este comando executa os pré-requisitos para determinar se a desinstalação de um controlador de domínio adicional em um domínio é possível. O comando também solicita que o usuário defina e confirme o local Senha de administrador antes de concluir o processo de desinstalação.


-localadministratorpassword (convertto-securestring "@abc123" -asplaintext -force) - Especifica uma senha de conta de administrador local quando o AD DS é removido de um controlador de domínio. Nas versões anteriores, onde a desinstalação do AD DS era feita usando Dcpromo.exe para rebaixamento, o padrão era permitir uma senha vazia para essa configuração. No Windows PowerShell, o módulo de implantação ADDS exige que um valor de cadeia de caracteres de senha não vazio seja atribuído. Se um valor não for fornecido para esse parâmetro, você será solicitado a inserir um valor para a senha no prompt do Windows PowerShell. O valor da senha deve ser uma sequência segura. Se este parâmetro não for especificado, o cmdlet solicitará que você insira e confirme uma senha mascarada. Este é o uso preferencial ao executar o cmdlet de forma interativa. Se adicionalmente não houver outros argumentos especificados com o cmdlet, você será solicitado a inserir uma senha mascarada para esse parâmetro, mas nenhuma confirmação da senha inserida será feita. Isso não é recomendado, pois pode permitir a configuração de uma senha digitada incorretamente. Outra opção avançada disponível é usar o cmdlet ConvertTo-SecureString e especificar a cadeia de caracteres de senha embutida como entrada de console não mascarada, o que também não é uma prática recomendada de segurança em implantações de produção.


#>


# Executa o rebaixamento de um controlador de domínio no Active Directory inserido a senha do administrador local como @abc123.



Uninstall-ADDSDomainController -localadministratorpassword (convertto-securestring "@abc123" -asplaintext -force)



<#


Explicação do comando: Uninstall-ADDSDomainController -localadministratorpassword (convertto-securestring "@abc123" -asplaintext -force)



Uninstall-ADDSDomainController - Este comando remove o AD DS de um controlador de domínio adicional em um domínio. O usuário é solicitado a definir e confirmar a senha do administrador local antes de concluir o processo de remoção.



-localadministratorpassword (convertto-securestring "@abc123" -asplaintext -force) - Especifica uma senha de conta de administrador local quando o AD DS é removido de um controlador de domínio. Nas versões anteriores, onde a desinstalação do AD DS era feita usando Dcpromo.exe para rebaixamento, o padrão era permitir uma senha vazia para essa configuração. No Windows PowerShell, o módulo de implantação ADDS exige que um valor de cadeia de caracteres de senha não vazio seja atribuído. Se um valor não for fornecido para esse parâmetro, você será solicitado a inserir um valor para a senha no prompt do Windows PowerShell. O valor da senha deve ser uma sequência segura. Se este parâmetro não for especificado, o cmdlet solicitará que você insira e confirme uma senha mascarada. Este é o uso preferencial ao executar o cmdlet de forma interativa. Se adicionalmente não houver outros argumentos especificados com o cmdlet, você será solicitado a inserir uma senha mascarada para esse parâmetro, mas nenhuma confirmação da senha inserida será feita. Isso não é recomendado, pois pode permitir a configuração de uma senha digitada incorretamente. Outra opção avançada disponível é usar o cmdlet ConvertTo-SecureString e especificar a cadeia de caracteres de senha embutida como entrada de console não mascarada, o que também não é uma prática recomendada de segurança em implantações de produção.

#>


# Desinstala


Uninstall-windowsfeature -Name AD-Domain-Services, DNS, GPMC, RSAT-AD-Tools, RSAT-AD-PowerShell



<#


Explicação do comando: Uninstall-windowsfeature -Name AD-Domain-Services, DNS, GPMC, RSAT-AD-Tools, RSAT-AD-PowerShell


Uninstall-windowsfeature - O comando Uninstall-WindowsFeature desinstala e opcionalmente remove funções, serviços de função e recursos especificados de um computador que executa o Windows Server ou de um disco rígido virtual (VHD) offline no qual o Windows Server está instalado. Este cmdlet funciona de forma semelhante à desinstalação de funções e recursos no Gerenciador do Servidor, com uma exceção importante: por padrão, as ferramentas de gerenciamento não são desinstaladas quando você executa o cmdlet Uninstall-WindowsFeature; você deve incluir o parâmetro IncludeManagementTools para desinstalar as ferramentas de gerenciamento associadas.

-Name - Especifica uma lista de recursos a serem desinstalados. Este parâmetro não suporta caracteres curinga.


#>




<#

Referências:


https://learn.microsoft.com/en-us/powershell/module/addsdeployment/test-addsdomaincontrolleruninstallation?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/addsdeployment/uninstall-addsdomaincontroller?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/servermanager/uninstall-windowsfeature?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/deploy/demoting-domain-controllers-and-domains--level-200-?WT.mc_id=5003815


#>