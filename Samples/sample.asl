	// Sample file from: http://wiki.osdev.org/AML
	Device (PS2K)
	{
		Name (_HID, EisaId ("PNP0303"))  // _HID: Hardware ID
		Method (_STA, 0, NotSerialized)  // _STA: Status
		{
			Return (0x0F)
		}

		Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
		{
			IO (Decode16,
				0x0060,             // Range Minimum
				0x0060,             // Range Maximum
				0x01,               // Alignment
				0x01,               // Length
				)
			IO (Decode16,
				0x0064,             // Range Minimum
				0x0064,             // Range Maximum
				0x01,               // Alignment
				0x01,               // Length
				)
			IRQ (Edge, ActiveHigh, Exclusive, )
				{1}
		})
		Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
		{
			StartDependentFn (0x00, 0x00)
			{
				FixedIO (
					0x0060,             // Address
					0x01,               // Length
					)
				FixedIO (
					0x0064,             // Address
					0x01,               // Length
					)
				IRQNoFlags ()
					{1}
			}
			EndDependentFn ()
		})
		Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
		{
			0x18, 
			0x03
		})
		Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
		{
			Store (Arg0, KBWK)
		}
	}