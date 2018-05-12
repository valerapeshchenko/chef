# jboss5-cookbook

This is a JBoss 5 cookbook. It's still in development. Feel free to contribute.

V. 1.0.0    - **Breaking change** - service is changed from jboss to jboss5.
            - Added travis to repo, working on automated tests.
            - Lots of rubocop style fixes.

V. 0.11.0   - Added a jboss5_user provider to create JBoss 5 standalone mgmt users.
            - Added sane defaults for bind addresses.

V. 0.10.2   - I realize I forgot to include sane defaults for the port numbers. Now added.

## Supported Platforms

Ubuntu 14.04

TODO: CentOS, Windows

## Providers

jboss5_user - JBoss 5 user takes two attributes, the "name" of the resource is the account you're adding to the management realm.
The password is HEX( MD5( username ':' realm ':' password)). The example password is: HEX( MD5(Administrator:ManagementRealm:changeit!))
You should be able to login to your JBoss management console with the user Administrator, password changeit!
The provider uses sed -i to delete users therefore is not GNU sed compliant. User beware!
The provider also only concerns itself with the standalone configuration.

TODO: Maybe put password in an encrpted databag?
Refactor into a HWRP/library to use native ruby commands to modify jboss user file, in order to be platform independant.
Add domain user configuration.

## GIT Location

https://github.com/andy-dufour/chef-jboss5

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['jboss5']['jboss_home']</tt></td>
    <td>String</td>
    <td>Path to the parent directory where JBoss will be installed. E.g., if you want JBoss installed in /opt/jboss, this would be /opt/</td>
    <td><tt>/opt/jboss/</tt></td>
  </tr>
  <tr>
    <td><tt>['jboss5']['jboss_user']</tt></td>
    <td>String</td>
    <td>User for JBoss to run as.</td>
    <td><tt>web</tt></td>
  </tr>
  <tr>
    <td><tt>['jboss5']['jboss_group']</tt></td>
    <td>String</td>
    <td>Group for JBoss to run as.</td>
    <td><tt>web</tt></td>
  </tr>
  <tr>
    <td><tt>['jboss5']['dl_url']</tt></td>
    <td>String</td>
    <td>URL to download the JBoss tarball from.</td>
    <td><tt>http://download.jboss.org/jbossas/5.1/jboss-as-5.1.1.Final/jboss-as-5.1.1.Final.tar.gz</tt></td>
  </tr>
  <tr>
    <td><tt>['jboss5']['jvm_min_mem']</tt></td>
    <td>String</td>
    <td>Sets your Xms JVM parameter</td>
    <td><tt>512m</tt></td>
  </tr>
  <tr>
    <td><tt>['jboss5']['jvm_max_mem']</tt></td>
    <td>String</td>
    <td>Sets your Xmx JVM parameter</td>
    <td><tt>1024m</tt></td>
  </tr>
  <tr>
    <td><tt>['jboss5']['jvm_perm_mem']</tt></td>
    <td>String</td>
    <td>Sets your PermGenSpace JVM parameter</td>
    <td><tt>256m</tt></td>
  </tr>
  <tr>
    <td><tt>['jboss5']['ajp_port']</tt></td>
    <td>String</td>
    <td>Sets your AJP port in standalone.xml</td>
    <td><tt>8009</tt></td>
  </tr>
  <tr>
    <td><tt>['jboss5']['http_port']</tt></td>
    <td>String</td>
    <td>Sets your HTTP port in standalone.xml</td>
    <td><tt>8080</tt></td>
  </tr>
  <tr>
    <td><tt>['jboss5']['https_port']</tt></td>
    <td>String</td>
    <td>Sets your HTTPS port in standalone.xml</td>
    <td><tt>8443</tt></td>
  </tr>
</table>

## Usage

### jboss5::default

Include `jboss5` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[jboss5::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Andrew DuFour (andy.k.dufour@gmail.com)
