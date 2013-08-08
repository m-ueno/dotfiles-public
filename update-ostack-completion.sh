rc_file=~/.dotfiles/.zshrc.ostack

_update_ostack_completion() {
    cat /dev/null > $rc_file
    for i in $@ ; do
        echo "install: $i"
        echo "\n# $i" >> $rc_file
        curl -L "https://raw.github.com/openstack/python-${i}client/master/tools/${i}.bash_completion" >> $rc_file
    done
}
# https://raw.github.com/openstack/python-novaclient/master/tools/nova.bash_completion
# https://raw.github.com/openstack/python-neutronclient/master/tools/neutron.bash_completion

_update_ostack_completion nova neutron keystone
