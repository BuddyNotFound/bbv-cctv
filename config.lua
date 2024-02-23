Config = {}
Config.Debug = false

-- READ ME --

-- QBCore = exports['qb-core']:GetCoreObject()  -- uncomment if you use QBCore
-- ESX = exports["es_extended"]:getSharedObject() -- uncomment if you use ESX

-- READ ME --

Config.Settings = {
    Framework = 'ST', -- ST/QB/ESX
    CamProp = "prop_cctv_cam_06a", -- prop used for the cameras.
    CommandEnabled = true, -- set to false if you use the item.
    OpenCommand = 'cctv', -- command used to open the tablet
    OpenKey = "O", -- key used to open the command (works only if you use a command)
    ItemName = "cctv_tablet", -- Name of the item used to open the tablet
    Job = { -- jobs allowed to use the command or item.
        'police',
        'sheriff',
    },
}

Config.CCTV = { 
	{
	name = 'Caesars Parking',
        pos = vector4(105.25, -1089.02, 33.86, 295.74),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203291466495959081/image.png?ex=65d08f81&is=65be1a81&hm=cca0cad33ca1fd75ad8013f0bedfd910dca9c231d21965a72a261ebc048620cd&', -- image
        enabled = true,
	},
    {
		name = 'Legion Square',
        pos = vector4(213.73, -926.0, 46.25, 94.65),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203292007284482168/image.png?ex=65d09002&is=65be1b02&hm=d4776752e96dbaac1ea614efcdcd0bc8eaddae1c90fcbfead3d81ab95a51b86e&',
        enabled = true,
	},
    { 
        name = 'Legion Square 2',
        pos = vector4(123.06, -895.35, 86.90, 255.01),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203292526568808528/image.png?ex=65d0907e&is=65be1b7e&hm=09adced8a6e20b802bd6e812b96adcec192c27bb6a23dc575a32c2f337261f1a&',
        enabled = true,
    },
    { 
        name = 'Pacific Bank #1',
        pos = vector4(236.18, 220.62, 109.36, 141.67),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203293338699042836/image.png?ex=65d09140&is=65be1c40&hm=d0da0bae096b6cd9aed57441d396efa52e82417fc2949fdf49dfb03049c4af8d&',
        enabled = true,
    },
    { 
        name = 'Pacific Bank #2',
        pos = vector4(255.17, 209.73, 109.38, 23.6),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203294005702426624/image.png?ex=65d091df&is=65be1cdf&hm=d2d352e33785e37dbab62b1e6627c008ee73d89d17e808d870444aa8a2d24446&',
        enabled = true,
    },
    { 
        name = 'Pacific Bank #3',
        pos = vector4(264.15, 221.49, 105.40, 53.99),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203293830523260949/image.png?ex=65d091b5&is=65be1cb5&hm=c5abbab69344c942a0f670f856ba2296fcdfe3ac48778c6128eb16448d5485c4&',
        enabled = true,
    },
    { 
        name = 'MRPD #1',
        pos = vector4(425.62, -988.97, 38.37, 55.85),
        url = 'https://cdn.discordapp.com/attachments/1133534812704079964/1203296296300183602/image.png?ex=65d09401&is=65be1f01&hm=1686aa4e9014f851f882c7e3750258998171488f2b0bfb6f6e5957b151169545&',
        enabled = true,
    },
    { 
        name = 'MRPD #2',
        pos = vector4(459.37, -1021.18, 35.70, 98.3),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203296918415867914/image.png?ex=65d09495&is=65be1f95&hm=e01503ebb572e14447753694bd0e76cb53f63b9b5d253352a9827a33b839ea35&',
        enabled = true,
    },
    { 
        name = 'MRPD #3',
        pos = vector4(467.76, -1026.6, 31.28, 284.74),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203297547565670430/image.png?ex=65d0952b&is=65be202b&hm=850724c61794b12a6f240b8769d5c64a29c976156f8027aa3645becd97536260&',
        enabled = true,
    },
    { 
        name = 'PillBox Medical #1',
        pos = vector4(282.8, -597.27, 47.05, 307.79),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203300376741154866/image.png?ex=65d097ce&is=65be22ce&hm=7870e75c3fe3da7a31bc8d02428ec40e8afdeef6cc96ddaae08f79d5b4690372&',
        enabled = true,
    },
    { 
        name = 'PillBox Medical #2',
        pos = vector4(293.53, -563.29, 46.93, 114.13),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203300507947634728/image.png?ex=65d097ed&is=65be22ed&hm=d6df6a9da6a9cef45aa5dc1c8f104389aa36f9abfd76e438c1b91042e42e718a&',
        enabled = true,
    },
    { 
        name = 'PillBox Medical #3',
        pos = vector4(301.6, -602.59, 46.86, 90.93),
        url = 'https://cdn.discordapp.com/attachments/870375951257731152/1203300617892921374/image.png?ex=65d09807&is=65be2307&hm=7097fbb7a031a388f0e8291f6aebedaf58cea82e110a6d7b73584f52c56e7818&',
        enabled = true,
    },
}
