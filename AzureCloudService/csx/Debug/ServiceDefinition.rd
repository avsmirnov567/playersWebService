<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureCloudService" generation="1" functional="0" release="0" Id="f1b72afc-a7df-49ca-aa47-63c55c5a53a8" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureCloudServiceGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="PlayerData:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureCloudService/AzureCloudServiceGroup/LB:PlayerData:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="PlayerData:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudService/AzureCloudServiceGroup/MapPlayerData:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="PlayerDataInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudService/AzureCloudServiceGroup/MapPlayerDataInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:PlayerData:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureCloudService/AzureCloudServiceGroup/PlayerData/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapPlayerData:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudService/AzureCloudServiceGroup/PlayerData/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapPlayerDataInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudService/AzureCloudServiceGroup/PlayerDataInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="PlayerData" generation="1" functional="0" release="0" software="c:\users\justw\documents\visual studio 2015\Projects\AzureCloudService\AzureCloudService\csx\Debug\roles\PlayerData" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;PlayerData&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;PlayerData&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudService/AzureCloudServiceGroup/PlayerDataInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudService/AzureCloudServiceGroup/PlayerDataUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudService/AzureCloudServiceGroup/PlayerDataFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="PlayerDataUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="PlayerDataFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="PlayerDataInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="0c763a26-414b-4bda-acfc-6c7f4797daf0" ref="Microsoft.RedDog.Contract\ServiceContract\AzureCloudServiceContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="c7373b73-486f-414a-bad9-145550f06bbd" ref="Microsoft.RedDog.Contract\Interface\PlayerData:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureCloudService/AzureCloudServiceGroup/PlayerData:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>