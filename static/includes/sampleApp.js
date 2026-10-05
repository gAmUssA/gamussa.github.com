Ext.Loader.setConfig({
	disableCaching : false,
	enabled : true,
	paths : {
		episode_3_pagination : 'app',
		Clear : 'clear'
	}
});

Ext.syncRequire('episode_3_pagination.init.InitDirect');
// Define GridPanel
var myStore = Ext.create('episode_3_pagination.store.dto.PersonStore',{});		//<1>
Ext.define('episode_3_pagination.view.SampleGridPanel', {
	extend : 'Ext.grid.Panel',
	store : myStore,
	alias : 'widget.samplegridpanel',
	autoscroll : true,
	plugins : [{
		ptype : 'cellediting'
	}],
	dockedItems: [
		{
			xtype: 'pagingtoolbar',		//<2>
			displayInfo: true,
			dock: 'top',
			store: myStore			//<3>
		}
	],
	columns : [
		{header : 'firstName', dataIndex : 'firstName', editor : {xtype : 'textfield'}, flex : 1 },
		{header : 'id', dataIndex : 'id', flex : 1 },
		{header : 'lastName', dataIndex : 'lastName', editor : {xtype : 'textfield'}, flex : 1 },
		{header : 'phone', dataIndex : 'phone', editor : {xtype : 'textfield'}, flex : 1 },
		{header : 'ssn', dataIndex : 'ssn', editor : {xtype : 'textfield'}, flex : 1 }],
	tbar : [
		{text : 'Load', action : 'load'},
		{text : 'Add', action : 'add'},
		{text : 'Remove', action : 'remove'},
		{text : 'Sync', action : 'sync'}
		]
	});
// Launch the application
Ext.application({
	name : 'episode_3_pagination',
	requires : ['Clear.override.ExtJSOverrider'],
	controllers : ['SampleController'],
	launch : function() {
		Ext.create('Ext.container.Viewport', {
			items : [{
				xtype : 'samplegridpanel'
			}]
		});
	}
});
